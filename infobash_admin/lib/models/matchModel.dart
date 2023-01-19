import 'package:infobash_admin/constants/initdata.dart';
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
  String tosswin;
  String tossdec;
  String inning1;
  String inning2;
  String inning1s;
  String inning2s;
  String matchstatus;
  MatchModel({
    this.id,
    required this.matchid,
    required this.team1,
    required this.team2,
    required this.groupid,
    required this.datetime,
    required this.winteam,
    required this.result,
    required this.matchtype,
    required this.overs,
    required this.bpo,
    required this.matchstatus,
    required this.tossdec,
    required this.tosswin,
    required this.inning1,
    required this.inning2,
    this.inning1s = Matchstatustype.notstared,
    this.inning2s = Matchstatustype.notstared,
  });
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
      'bpo': bpo,
      'tossdec': tossdec,
      'tosswin': tosswin,
      'inning1': inning1,
      'inning2': inning2,
      'inning1s': inning1s,
      'inning2s': inning2s,
      'matchstatus': matchstatus,
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
      matchstatus: map['matchstatus'],
      tossdec: map['tossdec'],
      tosswin: map['tosswin'],
      inning1: map['inning1'],
      inning2: map['inning2'],
      inning1s: map['inning1s'],
      inning2s: map['inning2s'],
    );
  }
}
