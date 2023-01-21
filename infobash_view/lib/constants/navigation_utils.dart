import 'package:flutter/material.dart';
import 'package:infobash_view/models/matchModel.dart';
import 'package:infobash_view/models/pointsmodel.dart';
import 'package:infobash_view/screens/match_details_screen.dart';
import 'package:infobash_view/screens/pendingscreen.dart';
import 'package:infobash_view/screens/points_table_screen.dart';
import 'package:infobash_view/screens/rules_screen.dart';
import 'package:infobash_view/screens/schedule_screen.dart';
import 'package:infobash_view/screens/team_details_screen.dart';
import 'package:infobash_view/screens/teams_screen.dart';
import 'package:infobash_view/screens/timescreen.dart';

void openTimes(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const TimeScreen()));
}

void openPending(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const PendingScreen()));
}

void openRules(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const RulesScreen()));
}

void openSchedule(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const ScheduleScreen()));
}

void openPointsTable(BuildContext context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const PointsTableScreen()));
}

void openTeams(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const TeamsScreen()));
}

void openTeamDetails(BuildContext context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const TeamDetailsScreen()));
}

void openBallDetails(
    BuildContext context, String matchid, MatchModel matchModel) async {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MatchDetailsScreen(
                matchid: matchid,
                mmdel: matchModel,
              )));
}
