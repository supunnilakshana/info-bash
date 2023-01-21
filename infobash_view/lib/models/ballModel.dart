

class BallModel {
  String id;
  String matchid;
  int bno;
  String diliverytype;
  // PlayerModel? baller;
  String datetime;
  String wickettype;
  String runtype;
  int overno;
  int totalmark;
  int emark;

  BallModel(
      {required this.id,
      required this.matchid,
      required this.diliverytype,
      // this.baller,
      required this.bno,
      required this.datetime,
      required this.wickettype,
      required this.runtype,
      required this.overno,
      required this.totalmark,
      required this.emark});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'matchid': matchid,
      'bno': bno,
      'diliverytype': diliverytype,
      // 'baller': baller,
      'datetime': datetime,
      'wickettype': wickettype,
      'runtype': runtype,
      'overno': overno,
      'tmark': totalmark,
      'emark': emark
    };
  }

  factory BallModel.fromMap(Map<String, dynamic> map) {
    return BallModel(
      id: map['id'],
      matchid: map['matchid'],
      bno: map['bno'],
      diliverytype: map['diliverytype'],
      //baller: PlayerModel.fromMap(map['baller']),
      datetime: map['datetime'],
      runtype: map['runtype'],
      wickettype: map['wickettype'],
      overno: map['overno'],
      totalmark: map['tmark'],
      emark: map['emark'],
    );
  }
}
