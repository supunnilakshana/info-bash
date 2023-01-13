import 'package:flutter/cupertino.dart';

class RegisterTeam{
  String? uid;
  String? teamName;
  String? email;
  int? academicYear;
  String? phoneNumber;
  String? leaderName;
  String? mPlayer1;
  String? mPlayer2;
  String? mPlayer3;
  String? mPlayer4;
  String? mPlayer5;
  String? mPlayer6;
  String? fPlayer1;
  String? fPlayer2;
  String? fPlayer3;
  bool? accept;

  RegisterTeam(
      {this.uid,
      this.teamName,
      this.email,
      this.phoneNumber,
      this.leaderName,
      this.academicYear,
      this.mPlayer1,
      this.mPlayer2,
      this.mPlayer3,
      this.mPlayer4,
      this.mPlayer5,
      this.mPlayer6,
      this.fPlayer1,
      this.fPlayer2,
      this.fPlayer3,
      this.accept});
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'teamName': teamName,
      'email': email,
      'academicYear': academicYear,
      'phoneNumber': phoneNumber,
      'leaderName': leaderName,
      'mPlayer1': mPlayer1,
      'mPlayer2': mPlayer2,
      'mPlayer3': mPlayer3,
      'mPlayer4': mPlayer4,
      'mPlayer5': mPlayer5,
      'mPlayer6': mPlayer6,
      'fPlayer1': fPlayer1,
      'fPlayer2': fPlayer2,
      'fPlayer3': fPlayer3,
      'accept': accept,
    };
  }

  factory RegisterTeam.fromMap(Map<String, dynamic> map) {
    return RegisterTeam(
      uid: map['uid'],
      teamName: map['teamName'],
      email: map['email'],
      academicYear: map['academicYear'],
      phoneNumber: map['phoneNumber'],
      leaderName: map['leaderName'],
      mPlayer1: map['mPlayer1'],
      mPlayer3: map['mPlayer3'],
      mPlayer2: map['mPlayer2'],
      mPlayer4: map['mPlayer4'],
      mPlayer5: map['mPlayer5'],
      mPlayer6: map['mPLayer6'],
      fPlayer1: map['fPlayer1'],
      fPlayer2: map['fPlayer2'],
      fPlayer3: map['fPlayer3'],
      accept: map['accept'],
    );
  }
  //
  // updateData(RegisterTeam userModel) {
  //   uid = userModel.uid;
  //   teamName = userModel.teamName;
  //   email = userModel.email;
  //   phoneNumber = userModel.phoneNumber;
  //   leaderName = userModel.leaderName;
  //   mPlayer1 = userModel.mPlayer1;
  //   academicYear = userModel.academicYear;
  //   mPlayer3 = userModel.mPlayer3;
  //   mPlayer2 = userModel.mPlayer2;
  //   mPlayer4 = userModel.mPlayer4;
  //   snum = userModel.phoneNumber;
  //   sdis = userModel.leaderName;
  //   scity = userModel.mPlayer1;
  //   notifyListeners();
  // }
  //
  // String sdis = "";
  // String scity = "";
  // String snum = "";
  // updatescity(String val) {
  //   scity = val;
  //   notifyListeners();
  // }
  //
  // updatesdis(String val) {
  //   sdis = val;
  //   notifyListeners();
  // }
  //
  // updatesphone(String val) {
  //   snum = val;
  //   notifyListeners();
  // }
}
