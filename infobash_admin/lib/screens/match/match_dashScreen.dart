// ignore: file_names
import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/constraints.dart';
import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/models/ballModel.dart';
import 'package:infobash_admin/models/matchModel.dart';
import 'package:infobash_admin/screens/components/buttons.dart';
import 'package:infobash_admin/screens/components/textfileds.dart';
import 'package:infobash_admin/services/date_time/date.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';
import 'package:infobash_admin/services/validator/validate_handeler.dart';

class MatchDashScreen extends StatefulWidget {
  final MatchModel matchModel;
  final bool is1stinning;
  const MatchDashScreen({
    Key? key,
    required this.matchModel,
    required this.is1stinning,
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
  int wickets = 0;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loadData();
        },
      ),
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
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 10),
                        child: Genaralbutton(
                          onpress: () async {
                            BallModel ballModel = BallModel(
                                id: Date.getDateTimeId(),
                                matchid: widget.is1stinning
                                    ? widget.matchModel.inning1
                                    : widget.matchModel.inning2,
                                bno: ball,
                                datetime: Date.getStringdatetimenow(),
                                totalmark: int.parse(marksfiledController.text),
                                emark: 2,
                                overno: over,
                                diliverytype: extraval,
                                runtype: markval,
                                wickettype: wicketval);

                            await FbHandeler.createDocManual(
                              ballModel.toMap(),
                              CollectionPath.ballpath(widget.matchModel.id!),
                              Date.getDateTimeId(),
                            );
                            print("${data.length}---------");
                            loadData();
                            clearval();
                          },
                          text: "Submit",
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

  clearval() {
    resultval = "";
    markval = "";
    extraval = "";
    wicketval = "";
    setState(() {});
  }
}
