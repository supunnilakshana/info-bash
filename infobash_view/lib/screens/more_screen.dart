import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infobash_view/screens/components/more_card.dart';
import 'package:infobash_view/screens/points_table_screen.dart';
import 'package:infobash_view/screens/schedule_screen.dart';
import 'package:infobash_view/screens/teams_screen.dart';

import '../constants/constraints.dart';

class MoreScreen extends StatefulWidget {
  static const routName = 'more-screen';
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More"
        ),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: Column(
        children: [
          MoreCard(text: "Rules & Regulations", function: (){

          }),
          MoreCard(text: "Teams", function: (){
            Navigator.of(context)
                .pushNamed(TeamsScreen.routName);
          }),
          MoreCard(text: "Schedule", function: (){
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => ScheduleScreen()));
          }),
          MoreCard(text: "Photos", function: (){}),
          MoreCard(text: "Points Table", function: (){
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => PointsTableScreen()));
    });
          })
        ],
      ),
    );
  }
}
