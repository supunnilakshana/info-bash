import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/send_mail_screen.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';
import '../models/usermodel.dart';
import 'components/buttons.dart';

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

  Future getTeam(id) async {
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

    return [teamName, email];
  }

  void request(bool accept) {
    RegisterTeam registerTeam = RegisterTeam();
    registerTeam.uid = uid;
    registerTeam.teamName = teamName;
    registerTeam.academicYear = academicYear;
    registerTeam.leaderName = leaderName;
    registerTeam.email = email;
    registerTeam.mPlayer1 = mPlayer1;
    registerTeam.mPlayer2 = mPlayer2;
    registerTeam.mPlayer3 = mPlayer3;
    registerTeam.mPlayer4 = mPlayer4;
    registerTeam.mPlayer5 = mPlayer5;
    registerTeam.mPlayer6 = mPlayer6;
    registerTeam.fPlayer1 = fPlayer1;
    registerTeam.fPlayer2 = fPlayer2;
    registerTeam.fPlayer3 = fPlayer3;
    registerTeam.accept = accept;

    FbHandeler.updateDoc(registerTeam.toMap(), "Team", uid.toString());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Team Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading == true
              ? Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Text(teamName.toString()),
                    Text(email.toString()),
                    Text(academicYear.toString()),
                    Text(mPlayer1.toString()),
                    Text(mPlayer2.toString()),
                    Text(mPlayer5.toString()),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Genaralbutton(
                            onpress: () {
                              request(true);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SendMailScreen(
                                      id: uid.toString(),
                                    ),
                                  ));
                            },
                            text: "Accept",
                            pleft: size.width * 0.2,
                            pright: size.width * 0.2,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Genaralbutton(
                            onpress: () {
                              request(false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SendMailScreen(
                                      id: uid.toString(),
                                    ),
                                  ));
                            },
                            text: "Reject",
                            pleft: size.width * 0.2,
                            pright: size.width * 0.2,
                          )
                        ],
                      ),
                    )
                  ],
                )
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
        ],
      ),
    );
  }
}
