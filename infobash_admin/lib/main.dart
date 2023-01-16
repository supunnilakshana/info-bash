import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/auth/check_signIn.dart';
import 'package:infobash_admin/screens/loginscreen.dart';
import 'package:infobash_admin/screens/requestscreen.dart';
import 'package:infobash_admin/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'models/view_model/view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          CheckSignIn.routName:(ctx)=> const CheckSignIn(),
          RequestScreen.routName:(ctx)=>const RequestScreen(),
          LogInScreen.routName:(ctx)=>const LogInScreen(),
          SplashScreen.routName:(ctx)=>const SplashScreen()
        },
        home: const SplashScreen(),
      ),
    );
  }
}
