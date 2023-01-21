import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/teammodel.dart';

class TeamListRow extends StatelessWidget {
  final RegisterTeam registerTeam;
  final Function() onTap;

  const TeamListRow(
      {super.key, required this.registerTeam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(
          icon: Icon(Icons.chevron_right_outlined),
          onPressed: onTap,
        ),
        title: Text(
          registerTeam.teamName.capitalize.toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
