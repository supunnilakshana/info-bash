import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/constraints.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';
import 'package:infobash_admin/services/validator/validate_handeler.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/view_model/view_model.dart';
import 'components/buttons.dart';

class SendMailScreen extends StatefulWidget {
  const SendMailScreen({Key? key}) : super(key: key);

  @override
  State<SendMailScreen> createState() => _SendMailScreenState();
}

class _SendMailScreenState extends State<SendMailScreen> {
  final _form = GlobalKey<FormState>();
  String? message;
  String? subjectHeader;

  TextEditingController subject = TextEditingController();
  TextEditingController msg = TextEditingController();

  void sendMail(String email, bool accept, String id) async {
    //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

    var headers = {
      'accept': 'application/json',
      'api-key':
          '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',
      'content-type': 'application/json',
    };

    var data1 = '{'
        '"sender": {"name": "Info Bash", "email": "hashan.ranasinghe98@gmail.com"},'
        '"to": [';

    var data2 = '{'
        '"email": "$email"'
        '}';

    var data3 = ' ],'
        '"subject": "$subjectHeader",'
        '"htmlContent":'
        '"$message"'
        '}';
    var data = data1 + data2 + data3;
    print(data);

    var url = Uri.parse('https://api.sendinblue.com/v3/smtp/email');
    var res = await http.post(url, headers: headers, body: data);
    if (res.statusCode != 201) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    } else {
      showSnackBar("Emails sent successfully.");
      msg.clear();
      subject.clear();
    }
    if (accept == false) {
      FbHandeler.deletedoc('Team', id);
    }
    print(res.body);
  }

  void showSnackBar(String text) {
    final snack = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: kPrimaryColorlight,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("send mail"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: Column(
        children: [
          Form(
            key: _form,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Send E-mail",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  TextFormField(
                    validator: (value) {
                      return Validater.genaralvalid(value.toString());
                    },
                    controller: subject,
                    decoration: InputDecoration(
                      hintText: "subject",
                      icon: Icon(Icons.subject),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: Color(0xFFE3E3E3FF), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: Color(0xFFE3E3E3FF), width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xFFCE0326), width: 2.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: Color(0xFFE3E3E3FF), width: 1.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 400,
                      child: TextFormField(
                        validator: (value) {
                          return Validater.genaralvalid(value.toString());
                        },
                        maxLines: 50,
                        keyboardType: TextInputType.multiline,
                        controller: msg,
                        decoration: InputDecoration(
                          hintText: "Message",
                          icon: Icon(Icons.message_outlined),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Color(0xFFE3E3E3FF), width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Color(0xFFE3E3E3FF), width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color(0xFFCE0326), width: 2.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Color(0xFFE3E3E3FF), width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Genaralbutton(
                    onpress: () {
                      sendMail(
                          viewModel.selectedTeam!.email,
                          viewModel.selectedTeam!.accept,
                          viewModel.selectedTeam!.teamId.toString());
                    },
                    text: "Send",
                    pleft: size.width * 0.2,
                    pright: size.width * 0.2,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
