import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/screens/registerscreen.dart';
import 'package:intl/intl.dart';
import 'components/regiseter_button.dart';

class TimeScreen extends StatefulWidget {
  static const routName = 'time-screen';
  const TimeScreen({Key? key}) : super(key: key);

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  bool isLoading = false;


  DateTime? date;
  Duration? remainDuration;
  String? remainDays;
  String? remainHours;
  String? remainMinutes;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTime();
    });
  }


  Future getTime() async {
    final userCollection = FirebaseFirestore.instance.collection('Time');
    DocumentSnapshot documentSnapshot = await userCollection.doc('uid').get();
    setState(() {
      date = DateTime.parse(documentSnapshot.get('date')!.toDate().toString());
      print(DateFormat('mm-hh-dd-MMM-yyy').format(date!));
      remainDuration = date!.difference(DateTime.now());
      String sDuration =
          "${remainDuration!.inDays}:${remainDuration!.inHours.remainder(24)}:${(remainDuration!.inMinutes.remainder(60))}";
      String strDigits(int n) => n.toString().padLeft(2, '0');
      print(sDuration);
      remainDays = strDigits(remainDuration!.inDays);
      remainHours = strDigits(remainDuration!.inHours.remainder(24));
      remainMinutes = strDigits(remainDuration!.inMinutes.remainder(60));
      isLoading = true;
      print(remainDuration);
      getTime();
    });
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: isLoading == true
            ? Column(
                children: [
                  Image.asset("assets/icons/app_icon.png"),
                  // Text('${days}:${hours}:${minutes}',style: TextStyle(
                  //   fontSize: 80
                  // ),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTimeCard(remainDays.toString(), 'Days'),
                      Column(
                        children: [_buildDot(), _buildDot()],
                      ),
                      _buildTimeCard(remainHours.toString(), 'Hours'),
                      Column(
                        children: [_buildDot(), _buildDot()],
                      ),
                      _buildTimeCard(remainMinutes.toString(), "Minutes"),
                    ],
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
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
