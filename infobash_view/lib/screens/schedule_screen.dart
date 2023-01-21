import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/constants/navigation_utils.dart';
import 'package:infobash_view/models/ballModel.dart';
import 'package:infobash_view/models/matchModel.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../view_model/view_model.dart';
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
          bottom: TabBar(
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
            _buildSemiFinal(teamViewModel),
            _buildFinal(teamViewModel),
          ],
        ),
      ),
    );
  }

  _ui(ViewModel viewModel) {
    if (viewModel.loading) {
      return Container(child: AppLoading());
    }
    if(viewModel.matchModel.isEmpty){
      return Center(
        child: Lottie.asset("assets/animations/nodata.json"),
      );}
    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) {
              MatchModel matchModel = viewModel.matchModel[index];

              return GestureDetector(
                onTap: () {
                  viewModel.setSelectedMatch(matchModel);

                  openBallDetails(context, matchModel.id!, matchModel);
                },
                child: ScheduleListRow(
                  matchModel: matchModel,
                ),
              );
            },
            itemCount: viewModel.matchModel.length));
  }
  _uiSemi(ViewModel viewModel) {
    if (viewModel.loading) {
      return Container(child: AppLoading());
    }
    if(viewModel.semiMatchModel.isEmpty){
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
                  viewModel.setSelectedMatch(matchModel);

                  openBallDetails(context, matchModel.id!, matchModel);
                },
                child: ScheduleListRow(
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
    if(viewModel.finalMatchModel.isEmpty){
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
                  viewModel.setSelectedMatch(matchModel);

                  openBallDetails(context, matchModel.id!, matchModel);
                },
                child: ScheduleListRow(
                  matchModel: matchModel,
                ),
              );
            },
            itemCount: viewModel.finalMatchModel.length));
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

  Widget _buildSemiFinal(ViewModel teamViewModel) {
    return Container(
        padding: EdgeInsets.all(20),
        child:Column(
          children: [
            _uiSemi(teamViewModel)
          ],
        ));
  }

  Widget _buildFinal(ViewModel teamViewModel) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _uiFinal(teamViewModel)
          ],
        ));
  }
}
