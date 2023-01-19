import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/match/matchstarting/match_start_screen.dart';
import 'package:provider/provider.dart';

import '../constants/constraints.dart';
import '../models/matchModel.dart';
import '../models/view_model/view_model.dart';
import 'components/app_loading.dart';
import 'components/match_list_row.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    ViewModel teamViewModel = context.watch<ViewModel>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColordark,
          actions: [
            Image.asset("assets/icons/app_icon.png"),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            tabs: [
              Tab(
                text: "Round",
              ),
              Tab(
                text: "Semi Final",
              ),
              Tab(
                text: "Final",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildRoundOne(teamViewModel),
            _buildSemiFinal(),
            _buildFinal(),
          ],
        ),
      ),
    );
  }

  _ui(ViewModel viewModel) {
    if (viewModel.loading) {
      return Container(child: const AppLoading());
    }
    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) {
              MatchModel matchModel = viewModel.matchModel[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MatchStartedScreen(
                                matchModelw: matchModel,
                              )));
                },
                child: TeamListRow(
                  matchModel: matchModel,
                ),
              );
            },
            itemCount: viewModel.matchModel.length));
  }

  Widget _buildRoundOne(ViewModel teamViewModel) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _ui(teamViewModel),
        ],
      ),
    );
  }

  Widget _buildSemiFinal() {
    return Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text("No Data"),
        ));
  }

  Widget _buildFinal() {
    return Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text("No Data"),
        ));
  }
}
