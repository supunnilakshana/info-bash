import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:infobash_view/models/usermodel.dart';
import '../../constants/initdata.dart';
import '../../models/matchModel.dart';

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
      Map<String, dynamic> model, String collectionpath, String? docid) async {
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
  static Future<List<MatchModel>> getallMatch() async {
    List<MatchModel> enlist = [];
    MatchModel enmodel;

    QuerySnapshot querySnapshot =
    await firestoreInstance.collection("/matchs/round1/data").get();
    final data = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(data);
    for (int i = 0; i < querySnapshot.docs.length; i++) {

      var a = querySnapshot.docs[i];

      enmodel = MatchModel.fromMap( a.id,a.data() as Map<String, dynamic>,);

      enlist.add(enmodel);
    }
    return enlist;
  }

//realtimedb
  static Future<int> checkfiledstatus(String collectionpath) async {
    final snapshot = await dbRef.child('$collectionpath').get();
    if (snapshot.exists) {
      return 0;
    } else {
      return 1;
    }
  }
  static Future getUpdate() async {
    final userCollection = FirebaseFirestore.instance.collection('initdata');
    DocumentSnapshot documentSnapshot = await userCollection.doc('appinfo').get();
    final s = documentSnapshot.get('mustupdate');
    return s;
  }
}
