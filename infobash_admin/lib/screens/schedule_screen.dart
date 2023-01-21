import 'package:flutter/material.dart';
import 'package:infobash_admin/screens/components/drawer.dart';
import 'package:infobash_admin/screens/match/matchstarting/match_start_screen.dart';
import 'package:lottie/lottie.dart';
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
        drawer: MenuDrawer(),
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
            RefreshIndicator(
                onRefresh: () {}, child: _buildRoundOne(teamViewModel)),
            _buildSemiFinal(teamViewModel),
            _buildFinal(teamViewModel),
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
      itemCount: viewModel.matchModel.length,
    ));
  }

  _uiSemi(ViewModel viewModel) {
    if (viewModel.loading) {
      return Container(child: AppLoading());
    }
    if (viewModel.semiMatchModel.isEmpty) {
      return Center(
        child: Lottie.asset("assets/animations/nodata.json"),
      );
    }
    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) {
              MatchModel matchModel = viewModel.semiMatchModel[index];

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
            itemCount: viewModel.semiMatchModel.length));
  }

  _uiFinal(ViewModel viewModel) {
    if (viewModel.loading) {
      return Container(child: AppLoading());
    }
    if (viewModel.finalMatchModel.isEmpty) {
      return Center(
        child: Lottie.asset("assets/animations/nodata.json"),
      );
    }
    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) {
              MatchModel matchModel = viewModel.finalMatchModel[index];

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
            itemCount: viewModel.finalMatchModel.length));
  }

  Widget _buildRoundOne(ViewModel teamViewModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _ui(teamViewModel),
        ],
      ),
    );
  }

  Widget _buildSemiFinal(ViewModel viewModel) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [_uiSemi(viewModel)],
        ));
  }

  Widget _buildFinal(ViewModel viewModel) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [_uiFinal(viewModel)],
        ));
  }
}
