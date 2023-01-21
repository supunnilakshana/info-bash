import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/navigation_utils.dart';

import 'package:provider/provider.dart';
import '../constants/constraints.dart';

import '../models/usermodel.dart';
import '../view_model/view_model.dart';
import 'components/app_loading.dart';
import 'components/team_card.dart';

class TeamsScreen extends StatefulWidget {
  static const routName = 'request-screen';
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  Stream<List<RegisterTeam>> allTeams() {
    return FirebaseFirestore.instance.collection("Team").snapshots().map(
            (snapshot) => snapshot.docs
            .map((doc) => RegisterTeam.fromMap(doc.data(), doc.id))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    ViewModel teamViewModel = context.watch<ViewModel>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Teams"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _ui(teamViewModel),
          ],
        ),
      ),
    );
  }

  _ui(ViewModel viewModel) {
    if (viewModel.loading) {
      return AppLoading();
    }
    print("==============================");

    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) {
              RegisterTeam userModel = viewModel.registerTeam[index];
              print(index);
              print(userModel.teamName);
              return TeamListRow(

                registerTeam: userModel,
                onTap: () async {
                  openTeamDetails(context);
                  viewModel.setSelectedTeam(userModel);
                },
              );
            },
            itemCount: viewModel.registerTeam.length));
  }
}
