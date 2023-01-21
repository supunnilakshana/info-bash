import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/constraints.dart';
import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/screens/components/buttons.dart';
import 'package:infobash_admin/screens/match/match_dashScreen.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';

import '../../../models/matchModel.dart';

class MatchStartedScreen extends StatefulWidget {
  const MatchStartedScreen({Key? key, required this.matchModelw})
      : super(key: key);
  final MatchModel matchModelw;

  @override
  State<MatchStartedScreen> createState() => _MatchStartedScreenState();
}

class _MatchStartedScreenState extends State<MatchStartedScreen> {
  late MatchModel matchModel;
  @override
  void initState() {
    matchModel = widget.matchModelw;
    if (matchModel.tosswin == nodata) {
      istossupdate = false;
    } else {
      istossupdate = true;
    }
    setState(() {});
    super.initState();
  }

  String tossval = '';

  String statusval = '';

  String wicketval = "";
  String ining1 = "";
  String ining2 = "";
  bool istossupdate = false;
  final rtitelStyle = const TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "${matchModel.team1.teamName} VS ${matchModel.team1.teamName}",
              style: const TextStyle(fontSize: 22),
            ),
            !istossupdate
                ? Column(
                    children: [
                      const Text(
                        "Toss",
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(
                                matchModel.team1.teamName,
                                style: rtitelStyle,
                              ),
                              leading: Radio(
                                value: matchModel.team1.teamId,
                                groupValue: tossval,
                                activeColor: kPrimaryColordark,
                                onChanged: (value) {
                                  setState(() {
                                    tossval = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                matchModel.team2.teamName,
                                style: rtitelStyle,
                              ),
                              leading: Radio(
                                value: matchModel.team2.teamId,
                                groupValue: tossval,
                                activeColor: kPrimaryColordark,
                                onChanged: (value) {
                                  setState(() {
                                    tossval = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Bat First",
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(
                                matchModel.team1.teamName,
                                style: rtitelStyle,
                              ),
                              leading: Radio(
                                value: matchModel.team1.teamId,
                                groupValue: statusval,
                                activeColor: kPrimaryColordark,
                                onChanged: (value) {
                                  setState(() {
                                    statusval = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                matchModel.team2.teamName,
                                style: rtitelStyle,
                              ),
                              leading: Radio(
                                value: matchModel.team2.teamId,
                                groupValue: statusval,
                                activeColor: kPrimaryColordark,
                                onChanged: (value) {
                                  setState(() {
                                    statusval = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Genaralbutton(
                          onpress: () async {
                            var model = matchModel;
                            model.tosswin = tossval;

                            if (statusval == model.team1.teamId) {
                              model.inning1 = model.team1.teamId;
                              model.inning2 = model.team2.teamId;
                            } else if (statusval == model.team2.teamId) {
                              model.inning1 = model.team2.teamId;
                              model.inning2 = model.team1.teamId;
                            }
                            model.inning1s = Matchstatustype.ongoning;
                            model.inning2s = Matchstatustype.notstared;
                            model.matchstatus = Matchstatustype.ongoning;
                            await FbHandeler.updateDoc(model.toMap(),
                                CollectionPath.matchpath, model.id!);

                            istossupdate = true;
                            matchModel = model;
                            setState(() {});
                          },
                          text: "Toss Create"),
                    ],
                  )
                : Container(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MatchDashScreen(
                              matchModel: matchModel,
                              is1stinning: true,
                            )));
              },
              child: Card(
                child: ListTile(
                  title: const Text("1 st inning"),
                  subtitle: Text(matchModel.inning1s),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                print("object");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MatchDashScreen(
                              is1stinning: false,
                              matchModel: matchModel,
                            )));
              },
              child: Card(
                child: ListTile(
                  title: const Text("2 nd inning"),
                  subtitle: Text(matchModel.inning2s),
                ),
              ),
            ),
            matchModel.matchstatus == Matchstatustype.end
                ? Card(
                    child: ListTile(
                      title: Text("WIN TEAM  "),
                      subtitle: Text(
                          matchModel.winteam == matchModel.team1.teamId
                              ? matchModel.team1.teamName
                              : matchModel.team2.teamName),
                    ),
                  )
                : Container(),
            matchModel.matchstatus == Matchstatustype.draw
                ? const Card(
                    child: ListTile(title: Text("Draw")),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
