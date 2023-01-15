import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/screens/auth/check_signIn.dart';
import 'package:infobash_view/screens/components/bottom_navigationbar.dart';
import 'package:infobash_view/screens/more_screen.dart';
import 'package:infobash_view/screens/points_table_screen.dart';
import 'package:infobash_view/screens/registerscreen.dart';
import 'package:infobash_view/screens/score_screen.dart';
import 'package:infobash_view/screens/splash_screen.dart';
import 'package:infobash_view/screens/teams_screen.dart';
import 'package:infobash_view/screens/timescreen.dart';
import 'package:infobash_view/view_model/view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewModel())
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Poppins"),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          BottomNavigation.routName:(ctx)=>const BottomNavigation(),
          ScoreScreen.routName:(ctx)=>const ScoreScreen(),
          SplashScreen.routName: (ctx) => const SplashScreen(),
          TimeScreen.routName:(ctx)=> const TimeScreen(),
          RegisterScreen.routName:(ctx)=>const RegisterScreen(),
          TeamsScreen.routName:(ctx)=> const TeamsScreen(),
          MoreScreen.routName:(ctx)=> const MoreScreen(),
          CheckSignIn.routName:(ctx)=> const CheckSignIn(),
        },
      ),
    );
  }
}
