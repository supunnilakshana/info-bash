import 'package:flutter/material.dart';
import 'package:infobash_view/screens/components/card.dart';
import 'package:infobash_view/screens/components/score_row.dart';
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
            ),
            ScoreRow(
                batterName: "Batter",
                runs: "R",
                balls: "B",
                fours: "4s",
                sixes: "6s"),
            ScoreRow(
                batterName: "Player x",
                runs: "02",
                balls: "01",
                fours: "00",
                sixes: "00"),
            ScoreRow(
                batterName: "Player y",
                runs: "25",
                balls: "16",
                fours: "04",
                sixes: "03"),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 2,
              ),
            ),
            ScoreRow(
                batterName: "Bowler",
                runs: "O",
                balls: "M",
                fours: "R",),
            ScoreRow(
              batterName: "Player z",
              runs: "1",
              balls: "o",
              fours: "5",),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 2,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
