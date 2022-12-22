import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/models/usermodel.dart';
import 'package:infobash_view/screens/components/buttons.dart';
import 'package:infobash_view/screens/components/textfileds.dart';
import 'package:infobash_view/screens/pendingscreen.dart';
import 'package:infobash_view/services/auth/signin_mannager.dart';
import 'package:infobash_view/services/firebase/fb_handeler.dart';
import 'package:infobash_view/services/validator/validate_handeler.dart';

class RegisterScreen extends StatefulWidget {
  static const routName = 'register-screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  String team = '';
  String email = "";
  String password = "";

  TextEditingController teamNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController academicYearController = TextEditingController();
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
                      label: "Team Leader",
                      onchange: (text) {},
                      controller: captainController,
                      save: (text) {},
                      valid: (text) {
                        return Validater.genaralvalid(text!);
                      },
                    ),
                    Text("Men"),
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
                    Text("Women"),
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
                    Gpasswordformfiled(
                        textinput: TextInputType.text,
                        icon: Icons.key,
                        onchange: (text) {
                          password = text;
                        },
                        save: (text) {
                          password = text!;
                        }),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Genaralbutton(
                            onpress: () {
                              teamRegistration(email, password);
                            },
                            text: "Register",
                            pleft: size.width * 0.2,
                            pright: size.width * 0.2,
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
  void teamRegistration(em, pw) {
    if (_form.currentState!.validate()) {
      User? user = _auth.currentUser;
      RegisterTeam registerTeam = RegisterTeam();
      registerTeam.uid = user!.uid;
      registerTeam.teamName = teamNameController.text;
      registerTeam.academicYear = int.parse(academicYearController.text);
      registerTeam.leaderName = captainController.text;
      registerTeam.email = emailController.text;
      registerTeam.mPlayer1 = mPlayer1Controller.text;
      registerTeam.mPlayer2 = mPlayer2Controller.text;
      registerTeam.mPlayer3 = mPlayer3Controller.text;
      registerTeam.mPlayer4 = mPlayer4Controller.text;
      registerTeam.mPlayer5 = mPlayer5Controller.text;
      registerTeam.mPlayer6 = mPlayer6Controller.text;
      registerTeam.fPlayer1 = wPlayer1Controller.text;
      registerTeam.fPlayer2 = wPlayer2Controller.text;
      registerTeam.fPlayer3 = wPlayer3Controller.text;
      registerTeam.accept = false;

      SigninManager()
          .signUp(em, pw)
          .then((value) => {
                FbHandeler.createDocManual(
                    registerTeam.toMap(), "Team", user.uid)
              })
          .then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PendingScreen(
                  id: user.uid.toString(),
                ),
              )));
      print(email);
    }
  }
}
