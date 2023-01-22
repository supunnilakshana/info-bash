import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infobash_view/constants/initdata.dart';
import 'package:infobash_view/screens/components/matchCard.dart';

import '../../models/matchModel.dart';

class ScheduleListRow extends StatelessWidget {
  final MatchModel matchModel;

  const ScheduleListRow({super.key, required this.matchModel});

  @override
  Widget build(BuildContext context) {
    print(matchModel.id);
    return MatchCard(
        group: matchModel.groupid,
        id: matchModel.matchid,
        team1: matchModel.team1.teamName.capitalize,
        team2: matchModel.team2.teamName.capitalize.toString(),
        status: (matchModel.matchstatus == Matchstatustype.ongoning)
            ? "Match is ongoing."
            : (matchModel.matchstatus == Matchstatustype.end)
                ? "Match is end."
                : (matchModel.matchstatus == Matchstatustype.draw)
                    ? "Match is Drawn."
                    : (matchModel.matchstatus == Matchstatustype.noresult)
                        ? "No Result"
                        : (matchModel.matchstatus == Matchstatustype.notstared)
                            ? "Match is Not Started"
                            : '');
  }
}
