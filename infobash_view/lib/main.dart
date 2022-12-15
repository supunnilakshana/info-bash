import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/screens/registerscreen.dart';
import 'package:infobash_view/screens/splash_screen.dart';
import 'package:infobash_view/screens/timescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        SplashScreen.routName: (ctx) => const SplashScreen(),
        TimeScreen.routName:(ctx)=> const TimeScreen(),
        RegisterScreen.routName:(ctx)=>const RegisterScreen(),
      },
    );
  }
}
