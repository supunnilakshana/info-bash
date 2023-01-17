import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/send_mail_screen.dart';
import 'package:infobash_admin/screens/team_details_screen.dart';

void openTeamDetails(BuildContext context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const TeamDetailsScreen()));
}

void openMail(BuildContext context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const SendMailScreen()));
}