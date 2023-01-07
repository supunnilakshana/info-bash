// ignore: file_names
import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/constraints.dart';
import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/screens/components/buttons.dart';
import 'package:infobash_admin/screens/components/textfileds.dart';
import 'package:infobash_admin/services/validator/validate_handeler.dart';

class MatchDashScreen extends StatefulWidget {
  const MatchDashScreen({Key? key}) : super(key: key);

  @override
  State<MatchDashScreen> createState() => _MatchDashScreenState();
}

class _MatchDashScreenState extends State<MatchDashScreen> {
  String resultval = "";
  String markval = "";
  String extraval = "";
  String wicketval = "";
  String bat1id = "";
  String bat2id = "";
  String bowid = "";
  String bat1nameValue = 'Select Bat 1';
  String bat2nameValue = 'Select Bat 2';
  String bownameValue = 'Select Bowler';
  final rtitelStyle = const TextStyle(fontWeight: FontWeight.bold);
  TextEditingController marksfiledController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.075,
                          right: size.width * 0.075,
                          top: size.height * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "Batmens ",
                              style: rtitelStyle,
                            ),
                          ),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                width: size.width * 0.9,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: bat1nameValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      bat1nameValue = newValue!;
                                      print(bat1nameValue);
                                    });
                                  },
                                  items: <String>[
                                    'Select Bat 1',
                                    'Supun Nilakshanar',
                                    'Dilshan Kumara',
                                    'Shagan Nimesh',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                width: size.width * 0.9,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: bat2nameValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      bat2nameValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Select Bat 2',
                                    'Supun Nilakshanar',
                                    'Dilshan Kumara',
                                    'Shagan Nimesh',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.075,
                          right: size.width * 0.075,
                          top: size.height * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "Bowler ",
                              style: rtitelStyle,
                            ),
                          ),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                width: size.width * 0.9,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: bownameValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      bownameValue = newValue!;
                                      print(bownameValue);
                                    });
                                  },
                                  items: <String>[
                                    'Select Bowler',
                                    'Supun Nilakshanar',
                                    'Dilshan Kumara',
                                    'Shagan Nimesh',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              bat1nameValue,
                              style: rtitelStyle,
                            ),
                            leading: Radio(
                              value: Idelivertype.wide,
                              groupValue: bat1id,
                              activeColor: kPrimaryColordark,
                              onChanged: (value) {
                                setState(() {
                                  bat1id = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              bat2nameValue,
                              style: rtitelStyle,
                            ),
                            leading: Radio(
                              value: Idelivertype.noball,
                              groupValue: bat2id,
                              activeColor: kPrimaryColordark,
                              onChanged: (value) {
                                setState(() {
                                  bat2id = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  //extra
                  children: [
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
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  //marks
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
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                  child: Genaralbutton(
                    onpress: () {},
                    text: "Submit",
                  ),
                )
              ],
            )),
      ),
    );
  }

  clearval() {
    resultval = "";
    markval = "";
    extraval = "";
    wicketval = "";
    setState(() {});
  }
}
