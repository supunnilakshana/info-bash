import 'package:infobash_admin/models/teammodel.dart';

class MatchModel {
  String? id;
  int matchid;
  String groupid;
  RegisterTeamDto team1;
  RegisterTeamDto team2;
  String datetime;
  String winteam;
  String result;
  String matchtype;
  int overs;
  String bpo;

  MatchModel(
      {this.id,
      required this.matchid,
      required this.team1,
      required this.team2,
      required this.groupid,
      required this.datetime,
      required this.winteam,
      required this.result,
      required this.matchtype,
      required this.overs,
      required this.bpo});
  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'matchid': matchid,
      'groupid': groupid,
      'team1': team1.toMap(),
      'team2': team2.toMap(),
      'datetime': datetime,
      'winteam': winteam,
      'result': result,
      'matchtype': matchtype,
      'overs': overs,
      'bpo': groupid
    };
  }

  factory MatchModel.fromMap(String id, Map<String, dynamic> map) {
    return MatchModel(
      id: id,
      matchid: map['matchid'],
      groupid: map['groupid'],
      team1: RegisterTeamDto.fromMap(map['team1']),
      team2: RegisterTeamDto.fromMap(map['team2']),
      datetime: map['datetime'],
      result: map['result'],
      winteam: map['winteam'],
      matchtype: map['matchtype'],
      overs: map['overs'],
      bpo: map['bpo'],
    );
  }
}
