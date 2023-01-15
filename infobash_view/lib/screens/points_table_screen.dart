import 'package:flutter/material.dart';
import 'package:infobash_view/models/pointsmodel.dart';
import 'package:infobash_view/view_model/view_model.dart';
import 'package:provider/provider.dart';
import '../constants/constraints.dart';
import 'components/app_loading.dart';

class PointsTableScreen extends StatefulWidget {
  static const routName = 'points-screen';
  const PointsTableScreen({Key? key}) : super(key: key);

  @override
  State<PointsTableScreen> createState() => _PointsTableScreenState();
}

class _PointsTableScreenState extends State<PointsTableScreen> {
  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
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
        body: buildPointsTable(viewModel));
  }

  Widget buildPointsTable(ViewModel viewModel) {
    if (viewModel.loading) {
      return Container(child: AppLoading());
    }
    final columns = ['Teams', 'P', 'W', 'L', 'Pts', 'NRR'];
    return DataTable(
        columns: getColumns(columns), rows: getRows(viewModel.pointsTable));
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();

  List<DataRow> getRows(List<PointsTable> points) =>
      points.map((PointsTable pointsTable) {
        final cells = [
          pointsTable.teamName,
          pointsTable.p,
          pointsTable.w,
          pointsTable.l,
          pointsTable.pts,
          pointsTable.nrr
        ];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
