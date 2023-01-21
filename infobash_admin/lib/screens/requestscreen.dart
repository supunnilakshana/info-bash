import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/navigation_utils.dart';
import 'package:provider/provider.dart';
import '../constants/constraints.dart';
import '../models/teammodel.dart';
import '../models/view_model/view_model.dart';
import 'components/app_loading.dart';
import 'components/team_card.dart';

class RequestScreen extends StatefulWidget {
  static const routName = 'request-screen';
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
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
        title: Text("Request"),
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
    print(viewModel);
    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) {
              RegisterTeam userModel = viewModel.registerTeam[index];
              return TeamListRow(
                registerTeam: userModel,
                onTap: () async {
                  viewModel.setSelectedTeam(userModel);
                  openTeamDetails(context);
                },
              );
            },
            itemCount: viewModel.registerTeam.length));
  }
}
