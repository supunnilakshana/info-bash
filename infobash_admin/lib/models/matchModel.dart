import 'package:infobash_admin/models/teammodel.dart';

class MatchModel {
  String id;
  String matchid;
  int bno;
  RegisterTeam team1;
  RegisterTeam team2;
  String datetime;
  String winteam;
  String result;
  String matchtype;

  MatchModel({
    required this.id,
    required this.matchid,
    required this.team1,
    required this.team2,
    required this.bno,
    required this.datetime,
    required this.winteam,
    required this.result,
    required this.matchtype,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'matchid': matchid,
      'bno': bno,
      'team1': team1,
      'team2': team2,
      'datetime': datetime,
      'winteam': winteam,
      'result': result,
      'matchtype': matchtype,
    };
  }

  factory MatchModel.fromMap(String id, Map<String, dynamic> map) {
    return MatchModel(
      id: id,
      matchid: map['matchid'],
      bno: map['bno'],
      team1: RegisterTeam.fromMap(map['team1']),
      team2: RegisterTeam.fromMap(map['team2']),
      datetime: map['datetime'],
      result: map['result'],
      winteam: map['winteam'],
      matchtype: map['matchtype'],
    );
  }
}
