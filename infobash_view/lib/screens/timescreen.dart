import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/screens/registerscreen.dart';
import 'components/regiseter_button.dart';

class TimeScreen extends StatefulWidget {
  static const routName = 'time-screen';
  const TimeScreen({Key? key}) : super(key: key);

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
  }

  Duration duration = const Duration();
  Timer? timer;
  static const maXSecond = 60;
  int seconds = maXSecond;
  int? minutes;

  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          RegisterButton(
            function: () {
              Navigator.of(context).pushNamed(RegisterScreen.routName);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset("assets/icons/app_icon.png"),
          // Text('${days}:${hours}:${minutes}',style: TextStyle(
          //   fontSize: 80
          // ),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeCard(days, 'Days'),
              Column(
                children: [_buildDot(), _buildDot()],
              ),
              _buildTimeCard(hours, 'Hours'),
              Column(
                children: [_buildDot(), _buildDot()],
              ),
              _buildTimeCard(minutes, "Minutes"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTimeCard(time, header) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.01,
          ),
          padding: EdgeInsets.all(20),
          child: Text(
            time,
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.black),
        ),
        Text(
          header,
          style: TextStyle(fontSize: 25),
        )
      ],
    );
  }

  Widget _buildDot() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 5, right: 5),
      child: Container(
        width: 10,
        height: 10,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Colors.black),
      ),
    );
  }
}
