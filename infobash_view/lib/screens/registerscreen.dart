import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/constants/initdata.dart';
import 'package:infobash_view/constants/navigation_utils.dart';
import 'package:infobash_view/models/playerModel.dart';
import 'package:infobash_view/models/usermodel.dart';
import 'package:infobash_view/screens/components/app_update.dart';
import 'package:infobash_view/screens/components/buttons.dart';
import 'package:infobash_view/screens/components/textfileds.dart';
import 'package:infobash_view/screens/components/tots.dart';
import 'package:infobash_view/services/firebase/fb_handeler.dart';
import 'package:infobash_view/services/validator/validate_handeler.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../view_model/view_model.dart';

class RegisterScreen extends StatefulWidget {
  static const routName = 'register-screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool update = false;
  final _form = GlobalKey<FormState>();

  String team = '';
  String email = "";
  String password = "";
  String pNumber = "";

  var uuid = const Uuid();

  TextEditingController teamNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController academicYearController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController captainController = TextEditingController();
  TextEditingController mPlayer1Controller = TextEditingController();
  TextEditingController mPlayer2Controller = TextEditingController();
  TextEditingController mPlayer3Controller = TextEditingController();
  TextEditingController mPlayer4Controller = TextEditingController();
  TextEditingController mPlayer5Controller = TextEditingController();
  TextEditingController mPlayer6Controller = TextEditingController();
  TextEditingController wPlayer1Controller = TextEditingController();
  TextEditingController wPlayer2Controller = TextEditingController();
  TextEditingController wPlayer3Controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    return _ui(viewModel);
  }

  Widget _ui(ViewModel viewModel) {
    Size size = MediaQuery.of(context).size;
    return (viewModel.appUpdate == true)
        ? AppUpdate()
        : Scaffold(
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
                padding: EdgeInsets.only(
                    left: size.width * 0.1,
                    right: size.width * 0.1,
                    top: size.height * 0.03),
                child: Form(
                  key: _form,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gtextformfiled(
                            label: "Team Name",
                            save: (text) {
                              team = text!;
                            },
                            onchange: (text) {
                              team = text;
                            },
                            controller: teamNameController,
                            valid: (text) {
                              return Validater.genaralvalid(text!);
                            }),
                        Gtextformfiled(
                          label: "Academic Year",
                          onchange: (text) {},
                          controller: academicYearController,
                          save: (text) {},
                          valid: (text) {
                            return Validater.isNumeric(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Email of Team leader",
                          onchange: (text) {
                            email = text;
                          },
                          controller: emailController,
                          save: (text) {
                            email = text!;
                          },
                          valid: (text) {
                            return Validater.vaildemail(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Phone Number of Team leader",
                          onchange: (text) {
                            pNumber = text;
                          },
                          controller: phoneNumberController,
                          save: (text) {
                            pNumber = text!;
                          },
                          valid: (text) {
                            return Validater.vaildmobile(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Team Leader",
                          onchange: (text) {},
                          controller: captainController,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Men",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                        Gtextformfiled(
                          label: "Player",
                          onchange: (text) {},
                          controller: mPlayer1Controller,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Player",
                          onchange: (text) {},
                          controller: mPlayer2Controller,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Player",
                          onchange: (text) {},
                          controller: mPlayer3Controller,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Player",
                          onchange: (text) {},
                          controller: mPlayer4Controller,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Player",
                          onchange: (text) {},
                          controller: mPlayer5Controller,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Player",
                          onchange: (text) {},
                          controller: mPlayer6Controller,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Women",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Gtextformfiled(
                          label: "Player",
                          onchange: (text) {},
                          controller: wPlayer1Controller,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Player",
                          onchange: (text) {},
                          controller: wPlayer2Controller,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Gtextformfiled(
                          label: "Player",
                          onchange: (text) {},
                          controller: wPlayer3Controller,
                          save: (text) {},
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.05,
                              bottom: size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Genaralbutton(
                                onpress: () {
                                  teamRegistration(email);
                                },
                                text: "Register",
                                pleft: size.width * 0.2,
                                pright: size.width * 0.2,
                                ptop: size.height * 0.02,
                                pbottom: size.height * 0.02,
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ));
  }

//team registration
  void teamRegistration(em) async {
    if (_form.currentState!.validate()) {
      RegisterTeam registerTeam = RegisterTeam(
          teamName: teamNameController.text,
          academicYear: int.parse(academicYearController.text),
          phoneNumber: phoneNumberController.text,
          leaderName: PlayerModel(
            id: uuid.v4(),
            name: captainController.text,
          ),
          email: emailController.text,
          mPlayer1: PlayerModel(
            id: uuid.v4(),
            name: mPlayer1Controller.text,
          ),
          mPlayer2: PlayerModel(
            id: uuid.v4(),
            name: mPlayer2Controller.text,
          ),
          mPlayer3: PlayerModel(
            id: uuid.v4(),
            name: mPlayer3Controller.text,
          ),
          mPlayer4: PlayerModel(
            id: uuid.v4(),
            name: mPlayer4Controller.text,
          ),
          mPlayer5: PlayerModel(
            id: uuid.v4(),
            name: mPlayer5Controller.text,
          ),
          mPlayer6: PlayerModel(
            id: uuid.v4(),
            name: mPlayer6Controller.text,
          ),
          fPlayer1: PlayerModel(
            id: uuid.v4(),
            name: wPlayer1Controller.text,
          ),
          fPlayer2: PlayerModel(
            id: uuid.v4(),
            name: wPlayer2Controller.text,
          ),
          fPlayer3: PlayerModel(
            id: uuid.v4(),
            name: wPlayer3Controller.text,
          ),
          accept: false);

      int r = await FbHandeler.createDocAuto(registerTeam.toMap(), "Team");
      if (r == resok) {
        openPending(context);
        Customtost.commontost(
            "You have successfully registered. ", kPrimaryColordark);
      }
      print(email);
    }
  }
}
