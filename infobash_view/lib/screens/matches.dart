import 'package:flutter/material.dart';
import 'package:infobash_view/screens/components/matchCard.dart';

import '../constants/constraints.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
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
              Tab(text: "Upcoming",),
              Tab(text:"Recent",)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildUpcomingScreen(),
            _buildRecentScreen(),
          ],
        ),
      ),
    );
  }
  Widget _buildUpcomingScreen(){

    return MatchCard(team1: "team1", team2: "team2",);
  }
  Widget _buildRecentScreen(){
    return MatchCard(team1: "team1",team2: "team2",);
  }

}
