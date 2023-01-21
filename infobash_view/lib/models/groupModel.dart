

import 'package:infobash_view/models/point_tablemode.dart';
import 'package:infobash_view/models/usermodel.dart';

class GroupModel {
  final String? id;
  final String name;
  final List<RegisterTeamDto>? teamlist;
  final List<PoinTableModel>? pointable;

  GroupModel({this.id, required this.name, this.teamlist, this.pointable});
  Map<String, dynamic> toMap(
      {required List<dynamic> tlist, required List<dynamic> plist}) {
    return {'name': name, 'teamlist': tlist, "pointable": plist};
  }

  factory GroupModel.fromMap(String id, Map<String, dynamic> map,
      List<RegisterTeamDto> list, List<PoinTableModel> pointtable) {
    return GroupModel(
        id: id, name: map['name'], teamlist: list, pointable: pointtable);
  }

  List<RegisterTeamDto> createlist(List<dynamic> map) {
    List<RegisterTeamDto> templist = [];
    map.forEach((element) {
      templist.add(RegisterTeamDto.fromMap(element));
    });
    return templist;
  }
}
