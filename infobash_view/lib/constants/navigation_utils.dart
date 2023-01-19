import 'package:flutter/material.dart';
import 'package:infobash_view/screens/pendingscreen.dart';
import 'package:infobash_view/screens/timescreen.dart';

void openTimes(BuildContext context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const TimeScreen()));
}

void openPending(BuildContext context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const PendingScreen()));
}
