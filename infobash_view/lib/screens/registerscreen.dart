import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/screens/components/Textfiledcontainer.dart';
import 'package:infobash_view/screens/components/buttons.dart';
import 'package:infobash_view/screens/components/roundedtextFiled.dart';
import 'package:infobash_view/screens/components/textfileds.dart';

class RegisterScreen extends StatefulWidget {
  static const routName = 'register-screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController teamName = TextEditingController();
  TextEditingController academicYear = TextEditingController();
  TextEditingController captain = TextEditingController();
  TextEditingController mPlayer1 = TextEditingController();
  TextEditingController mPlayer2 = TextEditingController();
  TextEditingController mPlayer3 = TextEditingController();
  TextEditingController mPlayer4 = TextEditingController();
  TextEditingController mPlayer5 = TextEditingController();
  TextEditingController mPlayer6 = TextEditingController();
  TextEditingController wPlayer1 = TextEditingController();
  TextEditingController wPlayer2 = TextEditingController();
  TextEditingController wPlayer3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Register your team"),
          toolbarHeight: size.height * 0.09,
          backgroundColor: kPrimaryColordark,
          actions: [
            Image.asset("assets/icons/app_icon.png"),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: size.width*0.1,right:size.width*0.1,top: size.height*0.03 ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              Gtextformfiled(
                label: "Team Name",
                onchange: (text) {},
                controller: teamName,
                save: (text) {},
                valid: (text) {},
              ),
              Gtextformfiled(
                label: "Academic Year",
                onchange: (text) {},
                controller: academicYear,
                save: (text) {},
                valid: (text) {},
              ),
              Gtextformfiled(
                label: "Team Leader",
                onchange: (text) {},
                controller: captain,
                save: (text) {},
                valid: (text) {},
              ),
              Text("Men"),
                  Gtextformfiled(
                    label: "Player",
                    onchange: (text) {},
                    controller: mPlayer1,
                    save: (text) {},
                    valid: (text) {},
                  ),
                  Gtextformfiled(
                    label: "Player",
                    onchange: (text) {},
                    controller: mPlayer2,
                    save: (text) {},
                    valid: (text) {},
                  ),
                  Gtextformfiled(
                    label: "Player",
                    onchange: (text) {},
                    controller: mPlayer3,
                    save: (text) {},
                    valid: (text) {},
                  ),
                  Gtextformfiled(
                    label: "Player",
                    onchange: (text) {},
                    controller: mPlayer4,
                    save: (text) {},
                    valid: (text) {},
                  ),
                  Gtextformfiled(
                    label: "Player",
                    onchange: (text) {},
                    controller: mPlayer5,
                    save: (text) {},
                    valid: (text) {},
                  ),
                  Gtextformfiled(
                    label: "Player",
                    onchange: (text) {},
                    controller: mPlayer6,
                    save: (text) {},
                    valid: (text) {},
                  ),
                  Text("Women"),
                  Gtextformfiled(
                    label: "Player",
                    onchange: (text) {},
                    controller: wPlayer1,
                    save: (text) {},
                    valid: (text) {},
                  ),
                  Gtextformfiled(
                    label: "Player",
                    onchange: (text) {},
                    controller: wPlayer2,
                    save: (text) {},
                    valid: (text) {},
                  ),
                  Gtextformfiled(
                    label: "Player",
                    onchange: (text) {},
                    controller: wPlayer3,
                    save: (text) {},
                    valid: (text) {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height*0.02,bottom: size.height*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Genaralbutton(onpress: (){},
                          text: "Register",
                          pleft: size.width*0.2,
                          pright: size.width*0.2,)
                      ],
                    ),
                  )


            ]),
          ),
        ));
  }
}
