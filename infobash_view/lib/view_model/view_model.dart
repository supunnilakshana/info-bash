import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:infobash_view/models/matchModel.dart';
import '../models/pointsmodel.dart';
import '../services/firebase/fb_handeler.dart';

class ViewModel extends ChangeNotifier {
  bool _loading = false;
  List<PointsTable> _pointsTable = [];
  List<MatchModel> _matchModel = [];
  bool _appUpdate =  false;

  bool get loading => _loading;
  bool get appUpdate => _appUpdate;
  List<PointsTable> get pointsTable => _pointsTable;
  List<MatchModel> get matchModel => _matchModel;

  ViewModel() {
    getPointsData();
    getMatchesData();
    getUpdateApp();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }
  setAppUpdate(bool appUpdate){
    _appUpdate = appUpdate;
    notifyListeners();
  }

  setPointsListModel(List<PointsTable> pointsTable) async {
    _pointsTable = pointsTable;
  }
  setMatchListModel(List<MatchModel> matchModel) async {
    _matchModel = matchModel;
  }



  getPointsData() async {
    setLoading(true);

    CollectionReference _cat = FirebaseFirestore.instance.collection("points");
    QuerySnapshot querySnapshot = await _cat.get();

    final _docData = querySnapshot.docs
        .map((doc) => PointsTable(
              uid: doc.get('uid'),
              teamName: doc.get('teamName'),
              p: doc.get('p'),
              pts: doc.get('pts'),
              nrr: doc.get('nrr'),
              l: doc.get('l'),
              w: doc.get('w'),
            ))
        .toList();
    setPointsListModel(_docData);
    setLoading(false);
    return _docData;
    // do any further processing as you want
  }

  getMatchesData() async {
    setLoading(true);
    final _doc = await FbHandeler.getallMatch();
    setMatchListModel(_doc);
    setLoading(false);
  }

  getUpdateApp()async{
    setLoading(true);
    final _appUpdate = await FbHandeler.getUpdate();
    setAppUpdate(_appUpdate);
    setLoading(false);

  }
}
