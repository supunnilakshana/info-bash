import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/navigation_utils.dart';
import 'package:lottie/lottie.dart';

import '../../constants/constraints.dart';

class AppUpdate extends StatelessWidget {
  const AppUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              openTimes(context);
            },
          ),
          title: Text("New version is available"),
          toolbarHeight: size.height * 0.09,
          backgroundColor: kPrimaryColordark,
          actions: [
            Image.asset("assets/icons/app_icon.png"),
          ],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/anim/update.json"),
                Text("You have to update the app.")
              ],
            ),
          ),
        ));
  }
}
