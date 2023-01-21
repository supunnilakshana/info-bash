import 'package:flutter/material.dart';
import 'package:infobash_view/screens/components/rules_card.dart';

import '../constants/constraints.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Rules and regulations"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            RulesCard(text: [
              "The tournament shall be known as the ‘INFO BASH V1.0’.",
              "Except for those laws that are unique to local playing situations and conditions , this tournament will abide by the latest available ICC Laws of Cricket document. ",
              "A player who has already played from one team cannot play from another team.",
              "No new players shall be allowed to register/play during the tournament without prior approval. "
            ], topic: "General"),
            RulesCard(text: [
              "The tournament will be proceeded in a league system.",
              "12 teams will take part in the tournament which consisted of 4 groups, 3 teams for each group. ",
              "Every team has to play with 2 opponent teams in round robin format.",
              "Each team will consist of 10 players. [ Boys -7, Girls- 3]",
              "All games shall be limited to a maximum of 5 overs. In group stage matches an over may be of 4/5 balls.",
              "The 1st over in each innings is compulsory for girls.",
              "Point System\n•	Win – 2 points\n•	Lose – 0 points\n•	No result /Abandoned – 1 point",
              "If a match is tied, there will be a super over to decide the winner. If the super over is also tied then give 1 point to each team",
              "In case of teams finishing with same number of points, following criteria will be used to determine the ranking exact order.\n•	Higher number of points\n•	Higher net run rate\n•	Most sixes + fours",
              "A dismissal is not valid for LBW( leg before wicket).",
              "When No ball has been called, neither batters shall be out under any of the laws except hit the ball twice, obstructing the field or run out. ",
              "All No balls will result in a free hit"
            ], topic: "Format"),
            RulesCard(text: [
              "Each team shall have 15-18 minutes to bowl their 5 overs. There is a 2 minutes warning time after 15-18 minutes, and if a team exceed that time umpire shall have the right to give 5 runs penalty for every 1 minute late.",
              "Umpire’s decisions are final.",
              "A batsman can be retired out/ not out after facing minimum 5 balls",
              "Wicketkeeper can be changed in every over. Wicketkeepers can also bowl.",
              "A side is declared all out only at the fall of the boy’s 6th wicket",
              "An over started must be completed all circumstances. ",
              "The tentative tournament schedule will be displayed before the tournament and updated throughout the tournament.",
              "Byes, leg byes and overthrows are counted as runs and byes & leg byes count as extras and overthrows count for batsman individual score.",
              "Special Rule- Scoring shots over/ pass the areas in both off/leg side except boundary counted areas are counted as 2 runs. "
            ], topic: "Rules Specific to this Tournament")
          ],
        ),
      ),
    );
  }
}
