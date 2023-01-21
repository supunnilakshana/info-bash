import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infobash_view/screens/components/matchCard.dart';

import '../../models/matchModel.dart';

class ScheduleListRow extends StatelessWidget {
  final MatchModel matchModel;

  const ScheduleListRow({super.key, required this.matchModel});

  @override
  Widget build(BuildContext context) {
print(matchModel.id);
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
