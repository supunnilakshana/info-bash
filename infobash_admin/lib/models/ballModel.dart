// ignore: file_names
import 'package:infobash_admin/models/playerModel.dart';

class BallModel {
  String? id;
  String matchid;
  int bno;
  PlayerModel batter;
  PlayerModel baller;
  String datetime;
  String resulttype;
  String result;
  PlayerModel hplayer;

  BallModel({
    this.id,
    required this.matchid,
    required this.batter,
    required this.baller,
    required this.bno,
    required this.datetime,
    required this.resulttype,
    required this.result,
    required this.hplayer,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'matchid': matchid,
      'bno': bno,
      'batter': batter,
      'baller': baller,
      'datetime': datetime,
      'resulttype': resulttype,
      'result': result,
      'hplayer': hplayer,
    };
  }

  factory BallModel.fromMap(String id, Map<String, dynamic> map) {
    return BallModel(
      id: id,
      matchid: map['matchid'],
      bno: map['bno'],
      batter: PlayerModel.fromMap(map['batter']),
      baller: PlayerModel.fromMap(map['baller']),
      datetime: map['datetime'],
      result: map['result'],
      resulttype: map['resulttype'],
      hplayer: PlayerModel.fromMap(map['hplayer']),
    );
  }
}
