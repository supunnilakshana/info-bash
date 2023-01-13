import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infobash_view/screens/components/player_card.dart';

import '../constants/constraints.dart';

class TeamDetailsScreen extends StatefulWidget {
  final String id;
  const TeamDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getTeam(widget.id);
    super.initState();
  }

  bool isLoading = false;


  String? uid;
  String? teamName;
  String? email;
  int? academicYear;
  String? phoneNumber;
  String? leaderName;
  String? mPlayer1;
  String? mPlayer2;
  String? mPlayer3;
  String? mPlayer4;
  String? mPlayer5;
  String? mPlayer6;
  String? fPlayer1;
  String? fPlayer2;
  String? fPlayer3;
  bool? accept;

  Future<List<String>> getTeam(id) async {
    final userCollection = FirebaseFirestore.instance.collection('Team');
    DocumentSnapshot documentSnapshot = await userCollection.doc(id).get();
    setState(() {
      uid = documentSnapshot.get('uid');
      teamName = documentSnapshot.get('teamName');
      email = documentSnapshot.get('email');
      academicYear = documentSnapshot.get('academicYear');
      phoneNumber = documentSnapshot.get('phoneNumber');
      leaderName = documentSnapshot.get('leaderName');
      mPlayer1 = documentSnapshot.get('mPlayer1');
      mPlayer2 = documentSnapshot.get('mPlayer2');
      mPlayer3 = documentSnapshot.get('mPlayer3');
      mPlayer4 = documentSnapshot.get('mPlayer4');
      mPlayer5 = documentSnapshot.get('mPlayer5');
      mPlayer6 = documentSnapshot.get('mPlayer6');
      fPlayer1 = documentSnapshot.get('fPlayer1');
      fPlayer2 = documentSnapshot.get('fPlayer2');
      fPlayer3 = documentSnapshot.get('fPlayer3');
      accept = documentSnapshot.get('accept');

      isLoading = true;
    });

    return [teamName.toString()];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: isLoading == true?Text(teamName!.capitalize.toString()):Container(),
          toolbarHeight: size.height * 0.09,
          backgroundColor: kPrimaryColordark,
          actions: [
            Image.asset("assets/icons/app_icon.png"),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            isLoading == true
                ? Column(
                    children: [
                        Container(
                          width: size.width,
                          color: kPrimaryColorlight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Players",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        PlayerCard(name: mPlayer1.toString()),
                      PlayerCard(name: mPlayer2.toString()),
                      PlayerCard(name: mPlayer3.toString()),
                      PlayerCard(name: mPlayer4.toString()),
                      PlayerCard(name: mPlayer5.toString()),
                      PlayerCard(name: mPlayer6.toString()),
                      PlayerCard(name: fPlayer1.toString()),
                      PlayerCard(name: fPlayer2.toString()),
                      PlayerCard(name: fPlayer3.toString()),

                      ])
                : Center(
                    child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ],
                  ))
          ]),
        ));
  }
}
