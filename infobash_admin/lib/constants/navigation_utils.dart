import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infobash_admin/screens/custom_match_screen.dart';
import 'package:infobash_admin/screens/home/home_screen.dart';
import 'package:infobash_admin/screens/home/round_start/round_start_view.dart';
import 'package:infobash_admin/screens/match/match_creation_screen.dart';
import 'package:infobash_admin/screens/requestscreen.dart';
import 'package:infobash_admin/screens/schedule_screen.dart';
import 'package:infobash_admin/screens/send_mail_screen.dart';
import 'package:infobash_admin/screens/team_details_screen.dart';

void openTeamDetails(BuildContext context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const TeamDetailsScreen()));
}

void openMail(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const SendMailScreen()));
}

void openRequest(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const RequestScreen()));
}

void openMatches(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const ScheduleScreen()));
}

void openSessionSchedule(BuildContext context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const RoundScheduleView()));
}

void opentest(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const HomeScreen()));
}

void openCustomMatch(BuildContext context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const CustomMatchScreen()));
}
