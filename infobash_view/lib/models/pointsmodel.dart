import 'package:flutter/cupertino.dart';

class PointsTable{
  String? uid;
  String? teamName;
  String? p;
  String? w;
  String? l;
  String? pts;
  String? nrr;


  PointsTable(
      {this.uid,
        this.teamName,
        this.p,
        this.w,
        this.l,
        this.pts,
        this.nrr,
});
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'teamName': teamName,
      'p': p,
      'w': w,
      'l': l,
      'pts': pts,
      'nrr': nrr,
    };
  }


  factory PointsTable.fromMap
      (Map<String, dynamic> map) {
    return PointsTable(
      uid: map['uid'],
      teamName: map['teamName'],
      p: map['p'],
      w: map['w'],
      l: map['l'],
      pts: map['pts'],
      nrr: map['nrr']

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
