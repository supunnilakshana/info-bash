import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/initdata.dart';
import 'package:infobash_view/models/groupModel.dart';
import 'package:infobash_view/models/point_tablemode.dart';
import 'package:infobash_view/models/pointsmodel.dart';
import 'package:infobash_view/services/firebase/fb_handeler.dart';
import 'package:infobash_view/view_model/view_model.dart';
import 'package:provider/provider.dart';
import '../constants/constraints.dart';
import '../models/matchModel.dart';
import 'components/app_loading.dart';

class PointsTableScreen extends StatefulWidget {
  static const routName = 'points-screen';
  const PointsTableScreen({Key? key}) : super(key: key);

  @override
  State<PointsTableScreen> createState() => _PointsTableScreenState();
}

class _PointsTableScreenState extends State<PointsTableScreen> {
  late Future<List<GroupModel>> futureData;
  @override
  void initState() {
    futureData = FbHandeler.getallGroup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Point Table"),
          toolbarHeight: size.height * 0.09,
          backgroundColor: kPrimaryColordark,
          actions: [
            Image.asset("assets/icons/app_icon.png"),
          ],
        ),
        body: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<GroupModel> data = snapshot.data as List<GroupModel>;
              data.sort((a, b) => a.name.compareTo(b.name));
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var gmodel = data[index].pointable;

                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data[index].name),
                        ),
                        buildPointsTable(gmodel!)
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {}
            return const Center(child: CupertinoActivityIndicator());
          },
        ));
  }

  Widget buildPointsTable(List<PoinTableModel> pmodel) {
    final columns = ['Teams', 'P', 'W', 'L', 'Pts'];
    return DataTable(columns: getColumns(columns), rows: getRows(pmodel));
  }

  List<DataRow> getRows(List<PoinTableModel> pmodel) =>
      pmodel.map((PoinTableModel pointsTable) {
        final cells = [
          pointsTable.team.teamName,
          pointsTable.played,
          pointsTable.win,
          pointsTable.loss,
          pointsTable.point,
        ];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
