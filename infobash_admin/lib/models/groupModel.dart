// ignore: file_names
import 'package:infobash_admin/models/teammodel.dart';

class GroupModel {
  final String? id;
  final String name;
  final List<RegisterTeam> teamlist;

  GroupModel({
    this.id,
    required this.name,
    required this.teamlist,
  });
  Map<String, dynamic> toMap() {
    return {'name': name, 'teamlist': teamlist};
  }

  factory GroupModel.fromMap(
      String id, Map<String, dynamic> map, List<RegisterTeam> list) {
    return GroupModel(
      id: id,
      name: map['name'],
      teamlist: list,
    );
  }

  List<RegisterTeam> createlist(List<dynamic> map) {
    List<RegisterTeam> templist = [];
    map.forEach((element) {
      templist.add(RegisterTeam.fromMap(element));
    });
    return templist;
  }
}
