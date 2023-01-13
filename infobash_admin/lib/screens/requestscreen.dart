import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/team_details_screen.dart';

import '../constants/constraints.dart';
import '../models/usermodel.dart';

class RequestScreen extends StatefulWidget {
  static const routName = 'request-screen';
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
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
        title: Text(
            "Request"
        ),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: StreamBuilder<List<RegisterTeam>>(
        stream: allTeams(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('=======================');
            print(snapshot.error);
            return Text("Something went ot wrong");
          } else if (snapshot.hasData) {
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
    return team.accept != true?Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          // trailing: Icon(
          //   Icons.message_outlined,
          //   color: primaryColor,
          // ),
          trailing: IconButton(
            icon: Icon(Icons.info_outline_rounded),
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
          title: Text(team.teamName.toString()),
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
    ):Container();
  }
}
