import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/constraints.dart';
import '../constants/navigation_utils.dart';

class PendingScreen extends StatefulWidget {
  final String? id;
  const PendingScreen({Key? key, this.id}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
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
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/anim/cricket.json'),
          Text("Your request is under reviewing.......")
        ],
      ),
    );
  }
}
