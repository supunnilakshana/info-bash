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
  String hplayer;

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

  factory BallModel.fromMap(Map<String, dynamic> map) {
    return BallModel(
      id: map['id'],
      matchid: map['matchid'],
      bno: map['bno'],
      batter: map['batter'],
      baller: map['baller'],
      datetime: map['datetime'],
      result: map['result'],
      resulttype: map['resulttype'],
      hplayer: map['hplayer'],
    );
  }
}
