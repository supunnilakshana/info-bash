


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../models/matchModel.dart';
import 'matchCard.dart';

class TeamListRow extends StatelessWidget {
 final MatchModel matchModel;

  const TeamListRow({super.key, required this.matchModel});



  @override
  Widget build(BuildContext context) {
    return MatchCard(
     id: matchModel.matchid,
     team1: matchModel.team1.teamName.capitalize,
     team2: matchModel.team2.teamName.capitalize.toString(),
     tossWin: (matchModel.tosswin) == (matchModel.team1.teamId)
         ? matchModel.team1.teamName.capitalize
         : "No data",
     optBat: (matchModel.tosswin) == (matchModel.inning1)
         ? matchModel.team1.teamName.capitalize
         : "",
    );
  }
}
