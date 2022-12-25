import 'package:flutter/material.dart';
import 'package:infobash_view/screens/components/card.dart';
import '../constants/constraints.dart';

class ScoreScreen extends StatefulWidget {
  static const routName = 'score-screen';
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Team1 vs Team2"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardView(
                function: () {},
                matchNumber: "4",
                team1: "Team 1",
                team2: "Team 2",
                total: "24",
                wicket: "4",
                overs: "3",
                balls: "3",
                decision: "Team 1"),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Divider(
                thickness: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
