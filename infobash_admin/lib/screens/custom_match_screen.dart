import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/models/matchModel.dart';
import 'package:infobash_admin/screens/components/customdropdown.dart';
import 'package:provider/provider.dart';

import '../constants/constraints.dart';
import '../models/teammodel.dart';
import '../models/view_model/view_model.dart';
import '../services/validator/validate_handeler.dart';
import 'components/buttons.dart';
import 'components/textfileds.dart';

class CustomMatchScreen extends StatefulWidget {
  const CustomMatchScreen({Key? key}) : super(key: key);

  @override
  State<CustomMatchScreen> createState() => _CustomMatchScreenState();
}

class _CustomMatchScreenState extends State<CustomMatchScreen> {
  TextEditingController ballController = TextEditingController();
  TextEditingController overController = TextEditingController();
  String? selectedValue = "";

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
        title: Text("Custom Match"),
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
            onpress: () async {
              print(team1);
              print(team2);
              print(matchType);
            },
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
