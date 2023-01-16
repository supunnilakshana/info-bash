// ignore: file_names
import 'package:infobash_admin/models/teammodel.dart';

class GroupModel {
  final String? id;
  final String name;
  final List<RegisterTeamDto>? teamlist;

  GroupModel({
    this.id,
    required this.name,
    this.teamlist,
  });
  Map<String, dynamic> toMap({required List<dynamic> tlist}) {
    return {'name': name, 'teamlist': tlist};
  }

  factory GroupModel.fromMap(
      String id, Map<String, dynamic> map, List<RegisterTeamDto> list) {
    return GroupModel(
      id: id,
      name: map['name'],
      teamlist: list,
    );
  }

  List<RegisterTeamDto> createlist(List<dynamic> map) {
    List<RegisterTeamDto> templist = [];
    map.forEach((element) {
      templist.add(RegisterTeamDto.fromMap(element));
    });
    return templist;
  }
}
