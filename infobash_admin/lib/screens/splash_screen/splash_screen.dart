// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/auth/check_signIn.dart';
import 'package:infobash_admin/screens/loginscreen.dart';
import 'package:infobash_admin/screens/requestscreen.dart';

import '../../constants/constraints.dart';

class SplashScreen extends StatefulWidget {
  static const routName = 'splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);

    return new Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed(CheckSignIn.routName);
  }

  initScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: kPrimaryColorlight),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.1,
                  left: size.width * 0.1,
                  right: size.width * 0.1),
              child: Image.asset("assets/icons/app_icon.png")),
          CircularProgressIndicator(color: kPrimaryColordark),
          SizedBox(
            height: size.height * 0.22,
          ),
          Text(
            "Copyright 2022 © Info Bash",
            style: TextStyle(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    ));
  }
}
