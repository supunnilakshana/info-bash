


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/screens/components/matchCard.dart';

import '../../models/matchModel.dart';

class TeamListRow extends StatelessWidget {
 final MatchModel matchModel;

  const TeamListRow({super.key, required this.matchModel});



  @override
  Widget build(BuildContext context) {
    return MatchCard(team1:matchModel.team1.teamName.toString(),
        team2: matchModel.team2.teamName.toString());;
  }
}