import 'package:flutter/cupertino.dart';
import 'package:infobash_view/models/playerModel.dart';

class RegisterTeam {
  String? teamId;
  String teamName;
  String email;
  int academicYear;
  String phoneNumber;
  PlayerModel leaderName;
  PlayerModel mPlayer1;
  PlayerModel mPlayer2;
  PlayerModel mPlayer3;
  PlayerModel mPlayer4;
  PlayerModel mPlayer5;
  PlayerModel mPlayer6;
  PlayerModel fPlayer1;
  PlayerModel fPlayer2;
  PlayerModel fPlayer3;
  bool accept;

  RegisterTeam(
      {this.teamId,
      required this.teamName,
      required this.email,
      required this.phoneNumber,
      required this.leaderName,
      required this.academicYear,
      required this.mPlayer1,
      required this.mPlayer2,
      required this.mPlayer3,
      required this.mPlayer4,
      required this.mPlayer5,
      required this.mPlayer6,
      required this.fPlayer1,
      required this.fPlayer2,
      required this.fPlayer3,
      required this.accept});
  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'email': email,
      'academicYear': academicYear,
      'phoneNumber': phoneNumber,
      'leaderName': leaderName.toMap(),
      'mPlayer1': mPlayer1.toMap(),
      'mPlayer2': mPlayer2.toMap(),
      'mPlayer3': mPlayer3.toMap(),
      'mPlayer4': mPlayer4.toMap(),
      'mPlayer5': mPlayer5.toMap(),
      'mPlayer6': mPlayer6.toMap(),
      'fPlayer1': fPlayer1.toMap(),
      'fPlayer2': fPlayer2.toMap(),
      'fPlayer3': fPlayer3.toMap(),
      'accept': accept,
    };
  }

  factory RegisterTeam.fromMap(Map<String, dynamic> map, String id) {
    return RegisterTeam(
      teamId: id,
      teamName: map['teamName'],
      email: map['email'],
      academicYear: map['academicYear'],
      phoneNumber: map['phoneNumber'],
      leaderName: PlayerModel.fromMap(map['leaderName']),
      mPlayer1: PlayerModel.fromMap(map['mPlayer1']),
      mPlayer3: PlayerModel.fromMap(map['mPlayer3']),
      mPlayer2: PlayerModel.fromMap(map['mPlayer2']),
      mPlayer4: PlayerModel.fromMap(map['mPlayer4']),
      mPlayer5: PlayerModel.fromMap(map['mPlayer5']),
      mPlayer6: PlayerModel.fromMap(map['mPLayer6']),
      fPlayer1: PlayerModel.fromMap(map['fPlayer1']),
      fPlayer2: PlayerModel.fromMap(map['fPlayer2']),
      fPlayer3: PlayerModel.fromMap(map['fPlayer3']),
      accept: map['accept'],
    );
  }
}
