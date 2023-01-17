


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
    return MatchCard(team1:matchModel.team1.teamName.capitalize.toString(),
        team2: matchModel.team2.teamName.capitalize.toString());
  }
}
