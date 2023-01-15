import 'package:flutter/material.dart';
import 'package:infobash_view/screens/components/card.dart';
import '../constants/constraints.dart';
import '../models/score_table_test/baller_score.dart';
import '../models/score_table_test/batter_score.dart';
import '../models/score_table_test/test_data.dart';

class ScoreScreen extends StatefulWidget {
  static const routName = 'score-screen';
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late List<BatterScore> batScoreList;
  late List<BallerScore> ballScoreList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.batScoreList = List.of(batScore);
    this.ballScoreList = List.of(ballScore);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Team1 vs Team2"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardView(
                function: () {},
                matchNumber: "4",
                team1: "Team 1",
                team2: "Team 2",
                total: "24",
                wicket: "4",
                overs: "3",
                balls: "3",
                decision: "Team 1"),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Divider(
                thickness: 2,
              ),
            ),
            buildBatterTable(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 2,
              ),
            ),
            buildBallerTable(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 2,
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget buildBatterTable() {
    final columns = ['Batter', 'R', 'B', '4s', '6s'];

    return DataTable(
        columns: getColumns(columns), rows: getRows(batScoreList));
  }
  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();

  List<DataRow> getRows(List<BatterScore> markTest) =>
      markTest.map((BatterScore markTest) {
        final cells=[markTest.BatterName,markTest.R,markTest.B,markTest.fours,markTest.sixes];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  Widget buildBallerTable() {
    final columns = ['Baller', 'O', 'M', 'R'];

    return DataTable(
        columns: getBallerColumns(columns), rows: getBallerRows(ballScoreList));
  }
  List<DataColumn> getBallerColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();

  List<DataRow> getBallerRows(List<BallerScore> markTest) =>
      markTest.map((BallerScore markTest) {
        final cells=[markTest.BallerName,markTest.O,markTest.M,markTest.R];
        return DataRow(cells: getBallCells(cells));
      }).toList();

  List<DataCell> getBallCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
