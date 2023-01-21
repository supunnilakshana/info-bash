import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:infobash_view/constants/initdata.dart';
import 'package:infobash_view/models/matchModel.dart';
import 'package:infobash_view/models/point_tablemode.dart';
import '../models/ballModel.dart';
import '../models/pointsmodel.dart';
import '../models/usermodel.dart';
import '../services/firebase/fb_handeler.dart';

class ViewModel extends ChangeNotifier {
  bool _loading = false;
  List<PointsTable> _pointsTable = [];
  List<MatchModel> _matchModel = [];
  List<MatchModel> _semiMatchModel = [];
  List<MatchModel> _finalMatchModel = [];
  RegisterTeam? _selectedTeam;
  List<RegisterTeam> _registerTeam = [];
  List<BallModel> _ballModel =  [];

  MatchModel? _selectedMatch;
  bool _appUpdate =  false;

  bool get loading => _loading;
  bool get appUpdate => _appUpdate;
  List<PointsTable> get pointsTable => _pointsTable;
  List<RegisterTeam> get registerTeam => _registerTeam;
  List<MatchModel> get matchModel => _matchModel;
  List<MatchModel> get semiMatchModel => _semiMatchModel;
  List<MatchModel> get finalMatchModel => _finalMatchModel;
  RegisterTeam? get selectedTeam => _selectedTeam;
  MatchModel? get selectedMatch => _selectedMatch;
  List<BallModel> get ballModel => _ballModel;


  ViewModel() {
    getPointsData();
    getMatchesData();
    getUpdateApp();
    getTeamsData();

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
  setSemiMatchListModel(List<MatchModel> semiMatchModel) async {
    _semiMatchModel = semiMatchModel;
  }
  setFinalMatchListModel(List<MatchModel> finalMatchModel) async {
    _finalMatchModel = finalMatchModel;
  }
  setTeamListModel(List<RegisterTeam> registerTeam) async {
    _registerTeam = registerTeam;
  }
  setSelectedTeam(RegisterTeam registerTeam) {
    _selectedTeam = registerTeam;
  }
  setBallsModel(List<BallModel> ballModel){
    _ballModel = ballModel;
  }
  setSelectedMatch(MatchModel matchModel) {
    _selectedMatch = matchModel;
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

  getSemiMatchesData() async {
    setLoading(true);
    final _doc = await FbHandeler.getallMatch(type: Matchtype.semi);
    setMatchListModel(_doc);
    setLoading(false);
  }

  getFinalMatchesData() async {
    setLoading(true);
    final _doc = await FbHandeler.getallMatch(type: Matchtype.finalm);
    setMatchListModel(_doc);
    setLoading(false);
  }

  getUpdateApp()async{
    setLoading(true);
    final _appUpdate = await FbHandeler.getUpdate();
    setAppUpdate(_appUpdate);
    setLoading(false);

  }

  getTeamsData() async {
    setLoading(true);
    final _doc = await FbHandeler.getallTeam();
    setTeamListModel(_doc);
    setLoading(false);
  }

  getBallsData(id) async{
    setLoading(true);
    print("====================");
    print(_selectedMatch?.id);
    final _doc = await FbHandeler.getballs(matchid: id);
    setBallsModel(_doc);
    print(_doc);
    setLoading(false);

  }
}
