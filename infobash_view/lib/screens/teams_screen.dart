import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infobash_view/screens/team_details_screen.dart';


import '../constants/constraints.dart';
import '../models/usermodel.dart';

class TeamsScreen extends StatefulWidget {
  static const routName = 'teams-screen';
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  Stream<List<RegisterTeam>> allTeams() {
    return FirebaseFirestore.instance.collection("Team").snapshots().map(
            (snapshot) => snapshot.docs
            .map((doc) => RegisterTeam.fromMap(doc.data()))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Teams"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: StreamBuilder<List<RegisterTeam>>(
        stream: allTeams(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final teams = snapshot.data!;
            return ListView(children: teams.map(buildTeam).toList());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildTeam(RegisterTeam team) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          // trailing: Icon(
          //   Icons.message_outlined,
          //   color: primaryColor,
          // ),
          trailing: IconButton(
            icon: Icon(Icons.arrow_right_outlined,size: 35,),
            onPressed: () {
              print(team.uid);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamDetailsScreen(
                      id: team.uid.toString(),
                    ),
                  ));
            },
          ),
          title: Text(team.teamName!.capitalize.toString()),
          // onTap: () {
          //   print("========================");
          //   print(user.id.toString());
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => AdminChatScreen(
          //           id: user.id.toString(),
          //           text: user.fName.toString(),
          //         ),
          //       ));
          // },
        ),
      ),
    );
  }
}
