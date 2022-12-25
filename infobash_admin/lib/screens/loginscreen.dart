import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/auth/check_signIn.dart';
import 'package:infobash_admin/screens/requestscreen.dart';
import 'package:infobash_admin/services/auth/signin_mannager.dart';

import '../services/validator/validate_handeler.dart';
import 'components/buttons.dart';
import 'components/textfileds.dart';

class LogInScreen extends StatefulWidget {
  static const routName = 'login-screen';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _form = GlobalKey<FormState>();
  String email = "";
  String password = "";

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                  ),
              child: Column(
                children: [
                  Gtextformfiled(
                    label: "Email",
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
                            SigninManager().signIn(email, password).then((value) =>
                                Navigator.of(context)
                                    .pushReplacementNamed(CheckSignIn.routName));
                          },
                          text: "Register",
                          pleft: size.width * 0.2,
                          pright: size.width * 0.2,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
