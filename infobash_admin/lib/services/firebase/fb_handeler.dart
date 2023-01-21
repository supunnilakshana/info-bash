import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:infobash_admin/models/ballModel.dart';
import 'package:infobash_admin/models/groupModel.dart';
import 'package:infobash_admin/models/matchModel.dart';
import 'package:infobash_admin/models/point_tablemode.dart';
import 'package:infobash_admin/models/teammodel.dart';
import '../../constants/initdata.dart';

class FbHandeler {
  static final user = FirebaseAuth.instance.currentUser;
  static final firestoreInstance = FirebaseFirestore.instance;
  static final DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  static const String chatboxpath = "chatbox";

//check doc is exists
  static Future<int> checkdocstatus(String collectionpath, String docid) async {
    var a = await FirebaseFirestore.instance
        .collection(collectionpath)
        .doc(docid)
        .get();
    if (a.exists) {
      return 1;
    } else if (!a.exists) {
      print('Not exists');
      return 0;
    } else {
      return 0;
    }
  }

// create doc random id;
  static Future<int> createDocAuto(
      Map<String, dynamic> model, String collectionpath) async {
    int res = resfail;
    try {
      await firestoreInstance
          .collection(collectionpath)
          .doc()
          .set(model)
          .then((_) {
        print("create  doc");
        res = resok;
      });
    } on Exception catch (e) {
      print(e);
      res = resfail;
    }

    return res;
  }

  // create doc manual id;
  static Future<int> createDocManual(
      Map<String, dynamic> model, String collectionpath, String docid) async {
    int res = resfail;
    try {
      await firestoreInstance
          .collection(collectionpath)
          .doc(docid)
          .set(model)
          .then((_) {
        print("create  doc");
        res = resok;
      });
    } on Exception catch (e) {
      print(e);
      res = resfail;
    }

    return res;
  }

//update doc
  static Future<int> updateDoc(
      Map<String, dynamic> model, String collectionpath, String docid) async {
    int res = resfail;
    try {
      await firestoreInstance
          .collection(collectionpath)
          .doc(docid)
          .update(model)
          .then((_) {
        print("update doc");
        res = resok;
      });
    } on Exception catch (e) {
      print(e);
      res = resfail;
    }
    return res;
  }

  //delete doc
  static Future<int> deletedoc(String collection, String docid) async {
    int res = resfail;
    try {
      await firestoreInstance.collection(collection).doc(docid).delete();
      print("delete doc");
      res = resok;
    } on Exception catch (e) {
      print(e);
      res = resfail;
    }
    return res;
  }

  //get match details
  static Future<List<MatchModel>> getallMatch(
      {String cpath = CollectionPath.matchpath}) async {
    List<MatchModel> enlist = [];
    MatchModel enmodel;

    QuerySnapshot querySnapshot = await firestoreInstance
        .collection(cpath)
        .orderBy('matchid', descending: false)
        .get();
    final data = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(data);
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];

      enmodel = MatchModel.fromMap(
        a.id,
        a.data() as Map<String, dynamic>,
      );

      enlist.add(enmodel);
    }
    return enlist;
  }

//get team details

  static Future<List<RegisterTeam>> getallTeam() async {
    List<RegisterTeam> enlist = [];
    RegisterTeam enmodel;
    QuerySnapshot querySnapshot =
        await firestoreInstance.collection(CollectionPath.teampath).get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];

      enmodel = RegisterTeam.fromMap(a.data() as Map<String, dynamic>, a.id);

      enlist.add(enmodel);
    }
    return enlist;
  }

//not use
  Future<List<MatchModel>> getmatchs(
      {String path = CollectionPath.matchdatapath}) async {
    List<MatchModel> enlist = [];
    MatchModel enmodel;
    QuerySnapshot querySnapshot = await firestoreInstance
        .collection(path)
        .orderBy("matchid", descending: false)
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];

      enmodel = MatchModel.fromMap(a.id, a.data() as Map<String, dynamic>);

      enlist.add(enmodel);
    }
    //enlist.sort((a, b) => a.matchid.compareTo(b.matchid));
    return enlist;
  }

  //get ball details

  static Future<List<BallModel>> getballs({required String matchid}) async {
    String path = CollectionPath.ballpath(matchid);
    List<BallModel> enlist = [];
    BallModel enmodel;
    QuerySnapshot querySnapshot =
        await firestoreInstance.collection(path).get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];

      enmodel = BallModel.fromMap(a.data() as Map<String, dynamic>);

      enlist.add(enmodel);
    }
    print("${enlist.length}------------------------------");
    enlist.sort((a, b) => b.matchid.compareTo(a.matchid));
    return enlist;
  }

//get group details

  static Future<List<GroupModel>> getallGroup() async {
    List<GroupModel> enlist = [];
    GroupModel enmodel;
    QuerySnapshot querySnapshot =
        await firestoreInstance.collection(CollectionPath.grouppath).get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      List<RegisterTeamDto> teamlist = [];
      List<PoinTableModel> pointtables = [];
      final tdata = a.data() as Map<String, dynamic>;

      final tlist = tdata["teamlist"] as List<dynamic>;
      for (var element in tlist) {
        teamlist.add(RegisterTeamDto.fromMap(element));
      }

      final tpointlist = tdata["pointable"] as List<dynamic>;
      for (var element in tpointlist) {
        pointtables.add(PoinTableModel.fromMap(element));
      }
      enmodel = GroupModel.fromMap(
          a.id, a.data() as Map<String, dynamic>, teamlist, pointtables);
      enlist.add(enmodel);
    }
    return enlist;
  }

  static Future<bool> getRoundstatus(String round) async {
    bool status = false;
    await firestoreInstance
        .collection(CollectionPath.initdata)
        .doc("matchdata")
        .get()
        .then((value) {
      status = (value.data()![round]);
    });
    return status;
  }

  static Future updateRoundstatus(String round) async {
    await firestoreInstance
        .collection(CollectionPath.initdata)
        .doc("matchdata")
        .update({round: true}).then((_) {});
  }

  static Future updatePointtable(MatchModel matchModel) async {
    final glist = await getAGroup(matchModel.groupid);
    var gmodel = glist.first;
    String win;
    String loss;

    if (matchModel.winteam == matchModel.team1.teamId) {
      win = matchModel.team1.teamId;
      loss = matchModel.team2.teamId;
    } else {
      win = matchModel.team2.teamId;
      loss = matchModel.team1.teamId;
    }
    print(win);
    print(loss);
    print(gmodel.pointable!.length);
    int winindex =
        gmodel.pointable!.indexWhere((element) => element.team.teamId == win);

    int lossindex =
        gmodel.pointable!.indexWhere((element) => element.team.teamId == loss);
    if (matchModel.matchstatus == Matchstatustype.end) {
      gmodel.pointable![winindex].played++;
      gmodel.pointable![winindex].win++;
      gmodel.pointable![winindex].point += 2;
      gmodel.pointable![lossindex].played++;
      gmodel.pointable![lossindex].loss++;
    } else if (matchModel.matchstatus == Matchstatustype.draw) {
      gmodel.pointable![winindex].played++;
      gmodel.pointable![lossindex].played++;
      gmodel.pointable![winindex].point += 1;
      gmodel.pointable![lossindex].point += 1;
    } else if (matchModel.matchstatus == Matchstatustype.draw) {
      gmodel.pointable![winindex].played++;
      gmodel.pointable![lossindex].played++;
      gmodel.pointable![lossindex].point += 1;
      gmodel.pointable![winindex].point += 1;
    }
    List<dynamic> uppoint = [];
    for (var element in gmodel.pointable!) {
      uppoint.add(element.toMap());
    }
    await firestoreInstance
        .collection(CollectionPath.grouppath)
        .doc(gmodel.id)
        .update({"pointable": uppoint}).then((_) {
      print("update doc");
    });
  }

  static Future<List<GroupModel>> getAGroup(String gname) async {
    List<GroupModel> enlist = [];
    GroupModel enmodel;
    QuerySnapshot querySnapshot = await firestoreInstance
        .collection(CollectionPath.grouppath)
        .where("name", isEqualTo: gname)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      var a = querySnapshot.docs.first;
      List<RegisterTeamDto> teamlist = [];
      List<PoinTableModel> pointtables = [];
      final tdata = a.data() as Map<String, dynamic>;

      final tlist = tdata["teamlist"] as List<dynamic>;
      for (var element in tlist) {
        teamlist.add(RegisterTeamDto.fromMap(element));
      }

      final tpointlist = tdata["pointable"] as List<dynamic>;
      for (var element in tpointlist) {
        pointtables.add(PoinTableModel.fromMap(element));
      }
      enmodel = GroupModel.fromMap(
          a.id, a.data() as Map<String, dynamic>, teamlist, pointtables);
      enlist.add(enmodel);
    }
    return enlist;
  }

//realtimedb
  static Future<int> checkfiledstatus(String collectionpath) async {
    final snapshot = await dbRef.child(collectionpath).get();
    if (snapshot.exists) {
      return 0;
    } else {
      return 1;
    }
  }
}
