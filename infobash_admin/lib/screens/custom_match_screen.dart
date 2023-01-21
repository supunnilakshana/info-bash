import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/models/matchModel.dart';
import 'package:infobash_admin/screens/components/customdropdown.dart';
import 'package:infobash_admin/screens/schedule_screen.dart';
import 'package:provider/provider.dart';

import '../constants/constraints.dart';
import '../models/teammodel.dart';
import '../models/view_model/view_model.dart';
import '../services/date_time/date.dart';
import '../services/firebase/fb_handeler.dart';
import '../services/validator/validate_handeler.dart';
import 'components/buttons.dart';
import 'components/textfileds.dart';
import 'components/tots.dart';

class CustomMatchScreen extends StatefulWidget {
  const CustomMatchScreen({Key? key}) : super(key: key);

  @override
  State<CustomMatchScreen> createState() => _CustomMatchScreenState();
}

class _CustomMatchScreenState extends State<CustomMatchScreen> {
  TextEditingController ballController = TextEditingController();
  TextEditingController overController = TextEditingController();
  String? selectedValue = "";
  bool canpressed = true;
  final period = ["Team  1", "Team 2", "team 3"];
  List<String> teams = [];
  final rtitelStyle = const TextStyle(fontWeight: FontWeight.bold);
  String matchType = '';
  String team1 = '';
  String team2 = '';

  @override
  Widget build(BuildContext context) {
    ViewModel teamViewModel = context.watch<ViewModel>();
    setState(() {
      teams = teamViewModel.registerTeam
          .map((RegisterTeam registerTeam) => registerTeam.teamName)
          .toList();
      print("====================");
      print(teams);
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Match"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomDropDown(
            valueList: teams.map(buildMenus).toList(),
            hint: "Teams",
            function: (team1) => setState(() {
              this.team1 = team1!;
            }),
          ),
          CustomDropDown(
              valueList: teams.map(buildMenus).toList(),
              hint: "Teams",
              function: (team2) => setState(() {
                    this.team2 = team2!;
                  })),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    "Semi-Final",
                    style: rtitelStyle,
                  ),
                  leading: Radio(
                    value: Matchtype.semi,
                    groupValue: matchType,
                    activeColor: kPrimaryColordark,
                    onChanged: (value) {
                      setState(() {
                        matchType = value.toString();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    "Final",
                    style: rtitelStyle,
                  ),
                  leading: Radio(
                    value: Matchtype.mfinal,
                    groupValue: matchType,
                    activeColor: kPrimaryColordark,
                    onChanged: (value) {
                      setState(() {
                        matchType = value.toString();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 150,
                child: Gnoiconformfiled(
                  onchange: (value) {},
                  valid: (value) {
                    return Validater.isNumeric(value!);
                  },
                  hintText: "Overs",
                  label: "Overs",
                  save: (value) {},
                  controller: overController,
                  textinput: TextInputType.number,
                ),
              ),
              Container(
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Gnoiconformfiled(
                  onchange: (value) {},
                  valid: (value) {
                    return Validater.isNumeric(value!);
                  },
                  hintText: "Balls",
                  label: "Balls",
                  save: (value) {},
                  controller: ballController,
                  textinput: TextInputType.number,
                ),
              ),
            ],
          ),
          Genaralbutton(
            pright: 30,
            pleft: 30,
            onpress: canpressed
                ? () async {
                    final teamlist = teamViewModel.registerTeam;
                    if (team1 != "" && team1 != "" && matchType != '') {
                      var tobj1 = teamlist
                          .firstWhere((element) => element.teamName == team1);
                      var tobj2 = teamlist
                          .firstWhere((element) => element.teamName == team2);
                      var rteam1 = RegisterTeamDto(
                          teamId: tobj1.teamId!,
                          teamName: tobj1.teamName,
                          email: tobj1.email,
                          phoneNumber: tobj1.phoneNumber,
                          leaderName: tobj1.leaderName,
                          academicYear: tobj1.academicYear,
                          mPlayer1: tobj1.mPlayer1,
                          mPlayer2: tobj1.mPlayer2,
                          mPlayer3: tobj1.mPlayer3,
                          mPlayer4: tobj1.mPlayer4,
                          mPlayer5: tobj1.mPlayer5,
                          mPlayer6: tobj1.mPlayer6,
                          fPlayer1: tobj1.fPlayer1,
                          fPlayer2: tobj1.fPlayer2,
                          fPlayer3: tobj1.fPlayer3,
                          accept: tobj1.accept);
                      var rteam2 = RegisterTeamDto(
                          teamId: tobj2.teamId!,
                          teamName: tobj2.teamName,
                          email: tobj2.email,
                          phoneNumber: tobj2.phoneNumber,
                          leaderName: tobj2.leaderName,
                          academicYear: tobj2.academicYear,
                          mPlayer1: tobj2.mPlayer1,
                          mPlayer2: tobj2.mPlayer2,
                          mPlayer3: tobj2.mPlayer3,
                          mPlayer4: tobj2.mPlayer4,
                          mPlayer5: tobj2.mPlayer5,
                          mPlayer6: tobj2.mPlayer6,
                          fPlayer1: tobj2.fPlayer1,
                          fPlayer2: tobj2.fPlayer2,
                          fPlayer3: tobj2.fPlayer3,
                          accept: tobj2.accept);
                      final matchmodel = MatchModel(
                          matchid: 1,
                          team1: rteam1,
                          team2: rteam2,
                          groupid: nodata,
                          datetime: Date.getStringdatenow(),
                          winteam: nodata,
                          result: nodata,
                          matchtype: matchType,
                          overs: int.parse(overController.text),
                          bpo: ballController.text,
                          matchstatus: Matchstatustype.notstared,
                          tossdec: nodata,
                          tosswin: nodata,
                          inning1: nodata,
                          inning2: nodata);
                      String path = CollectionPath.matchpath;
                      int res = await FbHandeler.createDocAuto(
                          matchmodel.toMap(), path);

                      Customtost.commontost("Successfull", Colors.blue);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => const ScheduleScreen()));
                    } else {

                      Customtost.commontost("Not Complete", Colors.red);
                    }
                  }
                : () => Customtost.commontost("still processing", Colors.amber),

            text: "Create",
            color: kPrimaryColordark,
          )
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenus(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
      ));
}
