import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:infobash_view/screens/components/bottom_navigationbar.dart';
import 'package:infobash_view/screens/pendingscreen.dart';

import '../registerscreen.dart';

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
          return const BottomNavigation();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Somthing wrong!!"),
          );
        } else {
          return const RegisterScreen();
        }
      },
    ));
  }
}
