import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/home/home_screen.dart';
import 'package:infobash_admin/screens/loginscreen.dart';
import 'package:infobash_admin/screens/requestscreen.dart';
import 'package:infobash_admin/screens/schedule_screen.dart';

class CheckSignIn extends StatelessWidget {
  static const routName = 'check-screen';
  const CheckSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const ScheduleScreen();
          //const RequestScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Somthing wrong!!"),
          );
        } else {
          return const LogInScreen();
        }
      },
    ));
  }
}
