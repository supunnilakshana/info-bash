// ignore: file_names
import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/constraints.dart';
import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/models/ballModel.dart';
import 'package:infobash_admin/models/matchModel.dart';
import 'package:infobash_admin/screens/components/buttons.dart';
import 'package:infobash_admin/screens/components/textfileds.dart';
import 'package:infobash_admin/screens/components/tots.dart';
import 'package:infobash_admin/screens/match/matchstarting/match_start_screen.dart';
import 'package:infobash_admin/services/date_time/date.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';
import 'package:infobash_admin/services/validator/validate_handeler.dart';

class MatchDashScreen extends StatefulWidget {
  final MatchModel matchModel;
  final bool is1stinning;
  final int in1score;
  const MatchDashScreen({
    Key? key,
    required this.matchModel,
    required this.is1stinning,
    this.in1score = 0,
  }) : super(key: key);

  @override
  State<MatchDashScreen> createState() => _MatchDashScreenState();
}

class _MatchDashScreenState extends State<MatchDashScreen> {
  String resultval = "";
  String markval = "";
  String iswicket = Wickettype.notout;
  String extraval = "";
  String wicketval = "";
  int over = 0;
  int ball = 0;
  int total = 0;
  int istscore = 0;
  int wickets = 0;
  bool canpress = true;
  late Future<List<BallModel>> ballList;
  final rtitelStyle = const TextStyle(fontWeight: FontWeight.bold);
  TextEditingController marksfiledController = TextEditingController();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match dashboard"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: FutureBuilder(
          future: ballList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BallModel> tempdata = snapshot.data as List<BallModel>;
              over = 0;
              ball = 1;
              total = 0;
              wickets = 0;
              List<BallModel> data = [];
              if (tempdata.isEmpty) {
                over = 0;
                ball = 1;
                total = 0;
                wickets = 0;
              } else {
                if (widget.is1stinning) {
                  for (var element in tempdata) {
                    if (element.matchid == widget.matchModel.inning1) {
                      data.add(element);
                    }
                  }
                } else {
                  for (var element in tempdata) {
                    if (element.matchid == widget.matchModel.inning2) {
                      data.add(element);
                    }
                  }
                }
                if (widget.is1stinning == false) {
                  for (var element in tempdata) {
                    if (element.matchid == widget.matchModel.inning1) {
                      istscore += element.totalmark;
                    }
                  }
                }

                if (data.isNotEmpty) {
                  data.sort((a, b) => b.id.compareTo(a.id));
                  for (var element in data) {
                    total += element.totalmark;
                    if (element.wickettype != '') {
                      wickets++;
                    }
                  }
                  final m = data.first;
                  print(m.toMap());
                  print(data.length);
                  over = m.overno;
                  ball = m.bno;
                  if (int.parse(widget.matchModel.bpo) <= m.bno - 1) {
                    ball = 1;
                    over++;
                  } else {
                    ball++;
                  }
                } else {
                  over = 0;
                  ball = 1;
                  total = 0;
                  wickets = 0;
                }
              }
              print(ball.toString() + "--------");
              return SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        //extra
                        children: [
                          Text(widget.is1stinning
                              ? "1 st Inning"
                              : "2 nd Inning"),
                          Text("overs $over . ${ball - 1}"),
                          Text("total $total / $wickets"),
                          !widget.is1stinning
                              ? Text("Target ${istscore + 1}")
                              : Container(),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'WB',
                                    style: rtitelStyle,
                                  ),
                                  leading: Radio(
                                    value: Idelivertype.wide,
                                    groupValue: extraval,
                                    activeColor: kPrimaryColordark,
                                    onChanged: (value) {
                                      setState(() {
                                        extraval = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'NB',
                                    style: rtitelStyle,
                                  ),
                                  leading: Radio(
                                    value: Idelivertype.noball,
                                    groupValue: extraval,
                                    activeColor: kPrimaryColordark,
                                    onChanged: (value) {
                                      setState(() {
                                        extraval = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'DB',
                                    style: rtitelStyle,
                                  ),
                                  leading: Radio(
                                    value: Idelivertype.dead,
                                    groupValue: extraval,
                                    activeColor: kPrimaryColordark,
                                    onChanged: (value) {
                                      setState(() {
                                        extraval = value.toString();
                                        markval = "";
                                        wicketval = "";
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'LB',
                                    style: rtitelStyle,
                                  ),
                                  leading: Radio(
                                    value: Idelivertype.legbyes,
                                    groupValue: extraval,
                                    activeColor: kPrimaryColordark,
                                    onChanged: (value) {
                                      setState(() {
                                        extraval = value.toString();
                                        markval = "";
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Bys',
                                    style: rtitelStyle,
                                  ),
                                  leading: Radio(
                                    value: Idelivertype.byes,
                                    groupValue: extraval,
                                    activeColor: kPrimaryColordark,
                                    onChanged: (value) {
                                      setState(() {
                                        extraval = value.toString();
                                        markval = "";
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'NO Ex',
                                    style: rtitelStyle,
                                  ),
                                  leading: Radio(
                                    value: Idelivertype.noex,
                                    groupValue: extraval,
                                    activeColor: kPrimaryColordark,
                                    onChanged: (value) {
                                      setState(() {
                                        extraval = value.toString();
                                        markval = "";
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      extraval != Idelivertype.dead
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '0',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Marktype.dot,
                                          groupValue: markval,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              markval = value.toString();
                                              makemarks();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '1',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Marktype.one,
                                          groupValue: markval,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              markval = value.toString();
                                              makemarks();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '2',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Marktype.two,
                                          groupValue: markval,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              markval = value.toString();
                                              makemarks();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '3',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Marktype.three,
                                          groupValue: markval,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              markval = value.toString();
                                              makemarks();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '4',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Marktype.four,
                                          groupValue: markval,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              markval = value.toString();
                                              makemarks();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '5',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Marktype.five,
                                          groupValue: markval,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              markval = value.toString();
                                              makemarks();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '6',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Marktype.six,
                                          groupValue: markval,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              markval = value.toString();
                                              makemarks();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '4 B',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Marktype.boundaryfour,
                                          groupValue: markval,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              markval = value.toString();
                                              makemarks();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          '6 B',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Marktype.boundarysix,
                                          groupValue: markval,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              markval = value.toString();
                                              makemarks();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          'OUT',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Wickettype.out,
                                          groupValue: iswicket,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              iswicket = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          'NOT OUT',
                                          style: rtitelStyle,
                                        ),
                                        leading: Radio(
                                          value: Wickettype.notout,
                                          groupValue: iswicket,
                                          activeColor: kPrimaryColordark,
                                          onChanged: (value) {
                                            setState(() {
                                              iswicket = value.toString();
                                              wicketval = "";
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                iswicket == Wickettype.out
                                    ? Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              'Bowled',
                                              style: rtitelStyle,
                                            ),
                                            leading: Radio(
                                              value: Wickettype.bowled,
                                              groupValue: wicketval,
                                              activeColor: kPrimaryColordark,
                                              onChanged: (value) {
                                                setState(() {
                                                  wicketval = value.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              'Run Out',
                                              style: rtitelStyle,
                                            ),
                                            leading: Radio(
                                              value: Wickettype.runout,
                                              groupValue: wicketval,
                                              activeColor: kPrimaryColordark,
                                              onChanged: (value) {
                                                setState(() {
                                                  wicketval = value.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              'Hit Wicket',
                                              style: rtitelStyle,
                                            ),
                                            leading: Radio(
                                              value: Wickettype.hitwicket,
                                              groupValue: wicketval,
                                              activeColor: kPrimaryColordark,
                                              onChanged: (value) {
                                                setState(() {
                                                  wicketval = value.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              'Catch Out',
                                              style: rtitelStyle,
                                            ),
                                            leading: Radio(
                                              value: Wickettype.catchout,
                                              groupValue: wicketval,
                                              activeColor: kPrimaryColordark,
                                              onChanged: (value) {
                                                setState(() {
                                                  wicketval = value.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              'Stump',
                                              style: rtitelStyle,
                                            ),
                                            leading: Radio(
                                              value: Wickettype.stump,
                                              groupValue: wicketval,
                                              activeColor: kPrimaryColordark,
                                              onChanged: (value) {
                                                setState(() {
                                                  wicketval = value.toString();
                                                });
                                              },
                                            ),
                                          )
                                        ],
                                      )
                                    : Container()
                              ],
                            )
                          : Container(),
                      extraval != Idelivertype.dead
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Gnoiconformfiled(
                                onchange: (value) {},
                                valid: (value) {
                                  return Validater.isNumeric(value!);
                                },
                                hintText: "FinalMarks",
                                label: "FinalMarks",
                                save: (value) {},
                                controller: marksfiledController,
                                textinput: TextInputType.number,
                              ),
                            )
                          : Container(),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, top: 10),
                          child: !ischase()
                              ? over < widget.matchModel.overs
                                  ? wickets < 9
                                      ? Genaralbutton(
                                          onpress: canpress
                                              ? () async {
                                                  canpress = false;
                                                  setState(() {});
                                                  bool isok = false;
                                                  if (extraval != "" &&
                                                      markval != "" &&
                                                      iswicket != "") {
                                                    if (iswicket ==
                                                        Wickettype.out) {
                                                      if (wicketval != "") {
                                                        isok = true;
                                                      } else {
                                                        isok = false;
                                                      }
                                                    } else {
                                                      isok = true;
                                                    }
                                                  } else {
                                                    isok = false;
                                                  }

                                                  if (isok) {
                                                    BallModel ballModel = BallModel(
                                                        id: Date
                                                            .getDateTimeId(),
                                                        matchid:
                                                            widget.is1stinning
                                                                ? widget
                                                                    .matchModel
                                                                    .inning1
                                                                : widget
                                                                    .matchModel
                                                                    .inning2,
                                                        bno: ball,
                                                        datetime: Date
                                                            .getStringdatetimenow(),
                                                        totalmark: int.parse(
                                                            marksfiledController
                                                                .text),
                                                        emark: 2,
                                                        overno: over,
                                                        diliverytype: extraval,
                                                        runtype: markval,
                                                        wickettype: wicketval);

                                                    await FbHandeler
                                                        .createDocManual(
                                                      ballModel.toMap(),
                                                      CollectionPath.ballpath(
                                                          widget
                                                              .matchModel.id!),
                                                      Date.getDateTimeId(),
                                                    );
                                                    print(
                                                        "${data.length}---------");
                                                    loadData();
                                                    clearval();
                                                    Customtost.commontost(
                                                        "Successfully Added",
                                                        Colors.blue);
                                                  } else {
                                                    Customtost.commontost(
                                                        "Filled correctly",
                                                        Colors.red);
                                                  }
                                                  canpress = true;
                                                  setState(() {});
                                                }
                                              : () {
                                                  Customtost.commontost(
                                                      "Still submitting",
                                                      Colors.amber);
                                                },
                                          text: "Submit",
                                        )
                                      : Text("Wicket is over")
                                  : Text("Over is over")
                              : Text("Chased")),
                      const SizedBox(
                        height: 100,
                      ),
                      !widget.is1stinning
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Genaralbutton(
                                    onpress: () {},
                                    text: "Win",
                                    color: Colors.green,
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Genaralbutton(
                                    onpress: () {},
                                    text: "Loss",
                                    color: Colors.red,
                                  ))
                                ],
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Genaralbutton(
                              onpress: () async {
                                var nmodel = widget.matchModel;
                                nmodel.inning1s = Matchstatustype.end;
                                nmodel.inning2s = Matchstatustype.ongoning;
                                await FbHandeler.updateDoc(nmodel.toMap(),
                                        CollectionPath.matchpath, nmodel.id!)
                                    .then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MatchStartedScreen(
                                                  matchModelw: nmodel)));
                                });
                              },
                              text: "End Inning",
                              color: Colors.red,
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Genaralbutton(
                              onpress: () {},
                              text: "Stop Inning",
                              color: Colors.red,
                            ))
                          ],
                        ),
                      )
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  loadData() {
    ballList = FbHandeler.getballs(matchid: widget.matchModel.id!);
    setState(() {});
  }

  int marks = 0;
  makemarks() {
    int tmarks = 0;
    if (extraval == Idelivertype.noball || extraval == Idelivertype.wide) {
      tmarks += 1;
    } else {
      tmarks = 0;
    }
    switch (markval) {
      case Marktype.dot:
        {
          tmarks += 0;
        }
        break;

      case Marktype.one:
        {
          tmarks += 1;
        }
        break;
      case Marktype.two:
        {
          tmarks += 2;
        }
        break;
      case Marktype.three:
        {
          tmarks += 3;
        }
        break;
      case Marktype.four:
        {
          tmarks += 4;
        }
        break;
      case Marktype.five:
        {
          tmarks += 5;
        }
        break;
      case Marktype.six:
        {
          tmarks += 6;
        }
        break;
      case Marktype.boundaryfour:
        {
          tmarks += 4;
        }
        break;
      case Marktype.boundarysix:
        {
          tmarks += 6;
        }
        break;
      default:
        {
          tmarks += 0;
        }
        break;
    }
    marks = tmarks;
    marksfiledController.text = tmarks.toString();

    setState(() {});
  }

  bool ischase() {
    bool tbool = false;
    if (!widget.is1stinning) {
      if (total > istscore) {
        tbool = true;
      }
    } else {
      tbool = false;
    }
    return tbool;
  }

  clearval() {
    resultval = "";
    markval = "";
    extraval = "";
    wicketval = "";
    marksfiledController.text = "";
    iswicket = Wickettype.notout;
    setState(() {});
  }
}
