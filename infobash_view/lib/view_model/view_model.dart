import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/pointsmodel.dart';

class ViewModel extends ChangeNotifier {
  bool _loading = false;
  List<PointsTable> _pointsTable = [];

  bool get loading => _loading;
  List<PointsTable> get pointsTable => _pointsTable;

  ViewModel() {
    getPointsData();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setPointsListModel(List<PointsTable> pointsTable) async {
    _pointsTable = pointsTable;
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
}
