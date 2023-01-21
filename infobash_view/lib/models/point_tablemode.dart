// ignore: file_points


import 'package:infobash_view/models/usermodel.dart';

class PointTableModel {
  final RegisterTeamDto team;
  int point;
  int played;
  int win;
  int loss;
  int notres;
  num nrr;

  PointTableModel({
    required this.team,
    required this.point,
    required this.played,
    required this.win,
    required this.loss,
    required this.notres,
    required this.nrr,
  });
  Map<String, dynamic> toMap() {
    return {
      'team': team.toMap(),
      'point': point,
      'played': played,
      'win': win,
      'loss': loss,
      'notres': notres,
      'nrr': nrr
    };
  }

  factory PointTableModel.fromMap(Map<String, dynamic> map) {
    return PointTableModel(
      team: RegisterTeamDto.fromMap(map['team']),
      point: map['point'],
      loss: map['loss'],
      notres: map['notres'],
      nrr: map['nrr'],
      played: map['played'],
      win: map['win'],
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
