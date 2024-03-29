// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_brace_in_string_interps
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infobash_view/constants/initdata.dart';
import 'package:infobash_view/models/matchModel.dart';
import 'package:infobash_view/screens/components/card.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:infobash_view/models/ballModel.dart';
import 'package:infobash_view/services/firebase/fb_handeler.dart';

import '../constants/constraints.dart';
import '../view_model/view_model.dart';

class MatchDetailsScreen extends StatefulWidget {
  const MatchDetailsScreen({
    Key? key,
    required this.matchid,
    required this.mmdel,
  }) : super(key: key);
  final String matchid;
  final MatchModel mmdel;
  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  late Future<MatchModel> futurematchdata;
  late Stream matchStream;
  late Stream ballStream;
  late String ballpath;
  int score1 = 0;
  int wickets1 = 0;
  double runrate1 = 0.0;
  int score2 = 0;
  int wickets2 = 0;
  double runrate2 = 0.0;
  int over1 = 0;
  int ball1 = 0;
  int over2 = 0;
  int ball2 = 0;

  @override
  void initState() {
    ballpath = CollectionPath.ballpath(widget.matchid);
    matchStream = FirebaseFirestore.instance
        .collection(CollectionPath.matchpath)
        .doc(widget.matchid)
        .snapshots();
    ballStream = FirebaseFirestore.instance.collection(ballpath).snapshots();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.mmdel.team1.teamName.capitalize} vs ${widget.mmdel.team2.teamName.capitalize}"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: SizedBox(
        width: size.width,
        child: StreamBuilder<dynamic>(
            stream: matchStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                DocumentSnapshot documentSnapshot =
                    snapshot.data as DocumentSnapshot;
                var matchModel = MatchModel.fromMap(documentSnapshot.id,
                    documentSnapshot.data() as Map<String, dynamic>);
                matchModel.toMap();

                List<BallModel> balllist = [];
                if (matchModel.matchstatus == Matchstatustype.notstared) {
                  return Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      Lottie.asset("assets/animations/cricketanimi.json",
                          width: size.height * 0.4),
                      Text("Match is not started yet")
                    ],
                  ));
                } else {
                  return Column(
                    children: [
                      StreamBuilder(
                        stream: ballStream,
                        builder: (context, snapshotball) {
                          if (snapshotball.hasData) {
                            balllist = [];
                            List<BallModel> ining1ballst = [];
                            List<BallModel> ining2ballst = [];
                            score1 = 0;
                            wickets1 = 0;
                            runrate1 = 0.0;
                            score2 = 0;
                            wickets2 = 0;
                            runrate2 = 0.0;
                            over1 = 0;
                            ball1 = 0;
                            over2 = 0;
                            ball2 = 0;

                            BallModel ballmodel;
                            QuerySnapshot querySnapshot =
                                snapshotball.data as QuerySnapshot;
                            for (int i = 0;
                                i < querySnapshot.docs.length;
                                i++) {
                              var a = querySnapshot.docs[i];
                              ballmodel = BallModel.fromMap(
                                  a.data() as Map<String, dynamic>);
                              balllist.add(ballmodel);
                            }

                            for (var element in balllist) {
                              if (element.matchid == matchModel.inning1) {
                                ining1ballst.add(element);
                              }
                            }

                            for (var element in balllist) {
                              if (element.matchid == matchModel.inning2) {
                                ining2ballst.add(element);
                              }
                            }

                            // balllist.sort((a, b) => b.matchid.compareTo(a.matchid));
                            ining1ballst
                                .sort((a, b) => b.matchid.compareTo(a.matchid));
                            ining2ballst
                                .sort((a, b) => b.matchid.compareTo(a.matchid));

                            for (var element in ining1ballst) {
                              score1 += element.totalmark;
                              if (element.wickettype != "") {
                                wickets1++;
                              }
                            }
                            for (var element in ining2ballst) {
                              score2 += element.totalmark;
                              if (element.wickettype != "") {
                                wickets2++;
                              }
                            }
                            if (ining1ballst.isNotEmpty) {
                              over1 = ining1ballst.last.overno;
                              ball1 = ining1ballst.last.bno;
                              if (ball1 == int.parse(matchModel.bpo)) {
                                ball1 = 0;
                                over1++;
                              }
                            }
                            if (ining2ballst.isNotEmpty) {
                              over2 = ining2ballst.last.overno;
                              ball2 = ining2ballst.last.bno;
                              if (ball2 == int.parse(matchModel.bpo)) {
                                ball2 = 0;
                                over2++;
                              }
                            }
                            return Expanded(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      if (matchModel.matchstatus ==
                                          Matchstatustype.ongoning)
                                        Column(
                                          children: [
                                            matchModel.inning1s ==
                                                        Matchstatustype
                                                            .ongoning ||
                                                    matchModel.inning1s ==
                                                        Matchstatustype.end
                                                ? CardView(
                                                    function: () {},
                                                    matchNumber: matchModel
                                                        .matchid
                                                        .toString(),
                                                    team1: (matchModel.inning1) ==
                                                            (matchModel
                                                                .team1.teamId)
                                                        ? matchModel
                                                            .team1.teamName
                                                        : matchModel
                                                            .team2.teamName,
                                                    team2: (matchModel.inning2) ==
                                                            (matchModel
                                                                .team2.teamId)
                                                        ? matchModel
                                                            .team1.teamName
                                                        : matchModel
                                                            .team2.teamName,
                                                    team1Tot: score1.toString(),
                                                    team1Wicket:
                                                        wickets1.toString(),
                                                    team2Tot: score2.toString(),
                                                    team2Wicket:
                                                        wickets2.toString(),
                                                    date: matchModel.datetime,
                                                    over1: over1.toString(),
                                                    ball1: ball1.toString(),
                                                    winToss: (matchModel
                                                                .tosswin ==
                                                            matchModel
                                                                .team1.teamId)
                                                        ? matchModel
                                                            .team1.teamName
                                                        : (matchModel.tosswin ==
                                                                matchModel.team2.teamId)
                                                            ? matchModel.team2.teamName
                                                            : '')
                                                : Container(),
                                            matchModel.inning2s ==
                                                        Matchstatustype
                                                            .ongoning ||
                                                    matchModel.inning2s ==
                                                        Matchstatustype.end
                                                ? CardView(
                                                    function: () {},
                                                    matchNumber: matchModel
                                                        .matchid
                                                        .toString(),
                                                    team1: (matchModel.inning1) ==
                                                            (matchModel
                                                                .team1.teamId)
                                                        ? matchModel
                                                            .team1.teamName
                                                        : matchModel
                                                            .team2.teamName,
                                                    team2: (matchModel.inning2) ==
                                                            (matchModel
                                                                .team2.teamId)
                                                        ? matchModel
                                                            .team1.teamName
                                                        : matchModel
                                                            .team2.teamName,
                                                    team1Tot: score1.toString(),
                                                    team1Wicket:
                                                        wickets1.toString(),
                                                    team2Tot: score2.toString(),
                                                    team2Wicket:
                                                        wickets2.toString(),
                                                    date: matchModel.datetime,
                                                    over1: over1.toString(),
                                                    ball1: ball1.toString(),
                                                    over2: over2.toString(),
                                                    ball2: ball2.toString(),
                                                    winToss: (matchModel
                                                                .tosswin ==
                                                            matchModel
                                                                .team1.teamId)
                                                        ? matchModel
                                                            .team1.teamName
                                                        : (matchModel.tosswin ==
                                                                matchModel.team2.teamId)
                                                            ? matchModel.team2.teamName
                                                            : '')
                                                : Container(),
                                          ],
                                        )
                                      else if (matchModel.matchstatus ==
                                          Matchstatustype.end)
                                        Column(
                                          children: [
                                            CardView(
                                                function: () {},
                                                matchNumber: matchModel.matchid
                                                    .toString(),
                                                team1: (matchModel.inning1) ==
                                                        (matchModel
                                                            .team1.teamId)
                                                    ? matchModel.team1.teamName
                                                    : matchModel.team2.teamName,
                                                team2: (matchModel.inning2) ==
                                                        (matchModel
                                                            .team2.teamId)
                                                    ? matchModel.team1.teamName
                                                    : matchModel.team2.teamName,
                                                team1Tot: score1.toString(),
                                                team1Wicket:
                                                    wickets1.toString(),
                                                team2Tot: score2.toString(),
                                                team2Wicket:
                                                    wickets2.toString(),
                                                date: matchModel.datetime,
                                                over1: over1.toString(),
                                                ball1: ball1.toString(),
                                                over2: over2.toString(),
                                                ball2: ball2.toString(),
                                                winToss: (matchModel.tosswin ==
                                                        matchModel.team1.teamId)
                                                    ? matchModel.team1.teamName
                                                    : (matchModel.tosswin ==
                                                            matchModel
                                                                .team2.teamId)
                                                        ? matchModel
                                                            .team2.teamName
                                                        : ''),
                                            // Text(matchModel.datetime),
                                            // Text(
                                            //     "inig 1   ${score1}/${wickets1}"),
                                            // Text(
                                            //     "inig 2   ${score2}/${wickets2}"),
                                            // Text(
                                            //     "winn team   ${score2}/${wickets2}"),
                                          ],
                                        ),
                                    ],
                                  ),
                                  Expanded(
                                    child: DefaultTabController(
                                      length: 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            color: kPrimaryColordark,
                                            constraints:
                                                const BoxConstraints.expand(
                                                    height: 50),
                                            child: const TabBar(
                                                indicatorColor: Colors.white,
                                                indicatorWeight: 4,
                                                tabs: [
                                                  Tab(
                                                    text: "Inning 1",
                                                  ),
                                                  Tab(text: "Inning 2"),
                                                ]),
                                          ),
                                          Expanded(
                                            child: TabBarView(children: [
                                              if (ining1ballst.isNotEmpty)
                                                ListView.builder(
                                                  itemCount:
                                                      ining1ballst.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var ballmodel1 =
                                                        ining1ballst[index];
                                                    return ListTile(
                                                      leading: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${ballmodel1.overno} . ${ballmodel1.bno} ",
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                          Text(
                                                            " ${ballmodel1.totalmark} runs",
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      title: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 5),
                                                            child: Container(
                                                                child: extraimg(ballmodel1
                                                                            .diliverytype) !=
                                                                        ""
                                                                    ? Image
                                                                        .asset(
                                                                        extraimg(
                                                                          ballmodel1
                                                                              .diliverytype,
                                                                        ),
                                                                        width:
                                                                            30,
                                                                      )
                                                                    : Container()),
                                                          ),
                                                          Container(
                                                              child: wicketimg(
                                                                          ballmodel1
                                                                              .wickettype) !=
                                                                      ""
                                                                  ? Image.asset(
                                                                      wicketimg(
                                                                        ballmodel1
                                                                            .wickettype,
                                                                      ),
                                                                      width: 30,
                                                                    )
                                                                  : Container()),
                                                          Container(
                                                              child: boundaryimg(
                                                                          ballmodel1
                                                                              .runtype) !=
                                                                      ""
                                                                  ? Image.asset(
                                                                      boundaryimg(
                                                                          ballmodel1
                                                                              .runtype),
                                                                      width: 30,
                                                                    )
                                                                  : Container()),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                )
                                              else
                                                Center(
                                                    child: Lottie.asset(
                                                        "assets/animations/nodata.json",
                                                        width: size.height *
                                                            0.15)),
                                              if (ining2ballst.isNotEmpty)
                                                ListView.builder(
                                                  itemCount:
                                                      ining2ballst.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var ballmodel2 =
                                                        ining2ballst[index];
                                                    return ListTile(
                                                      leading: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${ballmodel2.overno} . ${ballmodel2.bno} ",
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                          Text(
                                                            " ${ballmodel2.totalmark} runs",
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      title: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 5),
                                                            child: Container(
                                                                child: extraimg(ballmodel2
                                                                            .diliverytype) !=
                                                                        ""
                                                                    ? Image
                                                                        .asset(
                                                                        extraimg(
                                                                          ballmodel2
                                                                              .diliverytype,
                                                                        ),
                                                                        width:
                                                                            30,
                                                                      )
                                                                    : Container()),
                                                          ),
                                                          Container(
                                                              child: wicketimg(
                                                                          ballmodel2
                                                                              .wickettype) !=
                                                                      ""
                                                                  ? Image.asset(
                                                                      wicketimg(
                                                                        ballmodel2
                                                                            .wickettype,
                                                                      ),
                                                                      width: 30,
                                                                    )
                                                                  : Container()),
                                                          Container(
                                                              child: boundaryimg(
                                                                          ballmodel2
                                                                              .runtype) !=
                                                                      ""
                                                                  ? Image.asset(
                                                                      boundaryimg(
                                                                          ballmodel2
                                                                              .runtype),
                                                                      width: 30,
                                                                    )
                                                                  : Container()),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                )
                                              else
                                                Container(
                                                  child: Lottie.asset(
                                                      "assets/animations/nodata.json"),
                                                ),
                                            ]),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          if (snapshotball.hasError) {
                            return const Text('Something went wrong');
                          }
                          return const Center(
                              child: const CircularProgressIndicator());
                        },
                      )

                      // ListView.builder(
                      //     itemBuilder: (context, index) {
                      //       setState(() {});

                      //       return Text("id.toString()");
                      //     },
                      //     itemCount: matchViewModel.ballModel.length,
                      //     scrollDirection: Axis.vertical,
                      //     shrinkWrap: true)
                    ],
                  );
                }
              }
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  String boundaryimg(String type) {
    String img = "";
    if (Marktype.boundaryfour == type) {
      img = "assets/icons/four.png";
    } else if (Marktype.boundarysix == type) {
      img = "assets/icons/six.png";
    } else {
      img = "";
    }
    return img;
  }

  String wicketimg(String type) {
    String img = "";
    if (type != "") {
      img = "assets/icons/wicket.png";
    } else {
      img = "";
    }
    return img;
  }

  String extraimg(String type) {
    String img = "";
    if (type == Idelivertype.noball) {
      img = "assets/icons/noball.png";
    } else if (type == Idelivertype.wide) {
      img = "assets/icons/wide.png";
    } else if (type == Idelivertype.byes) {
      img = "assets/icons/by.png";
    } else if (type == Idelivertype.legbyes) {
      img = "assets/icons/legby.png";
    } else if (type == Idelivertype.dead) {
      img = "assets/icons/by.png";
    } else {
      img = "";
    }
    return img;
  }
}
