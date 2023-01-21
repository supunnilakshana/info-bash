import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:infobash_admin/models/teammodel.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';

import '../../constants/initdata.dart';
import '../matchModel.dart';


class ViewModel extends ChangeNotifier {
  bool _loading = false;
  List<RegisterTeam> _registerTeam = [];
  RegisterTeam? _selectedTeam;
  List<MatchModel> _matchModel = [];
  List<MatchModel> _semiMatchModel = [];
  List<MatchModel> _finalMatchModel = [];



  bool get loading => _loading;
  List<RegisterTeam> get registerTeam => _registerTeam;
  RegisterTeam? get selectedTeam => _selectedTeam;
  List<MatchModel> get matchModel => _matchModel;
  List<MatchModel> get semiMatchModel => _semiMatchModel;
  List<MatchModel> get finalMatchModel => _finalMatchModel;



  ViewModel() {
    getTeamsData();
    getMatchesData();
    getSemiMatchesData();
    getFinalMatchesData();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setTeamListModel(List<RegisterTeam> registerTeam) async {
    _registerTeam = registerTeam;
  }

  setSelectedTeam(RegisterTeam registerTeam) {
    _selectedTeam = registerTeam;
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

  update()async{
    _selectedTeam!.accept = true;
    FbHandeler.updateDoc(_selectedTeam!.toMap(), "Team", _selectedTeam!.teamId.toString());
    notifyListeners();
  }


  getTeamsData() async {
    setLoading(true);
    final _doc = await FbHandeler.getallTeam();
    setTeamListModel(_doc);
    setLoading(false);
  }
  getMatchesData() async {
    setLoading(true);
    final _doc = await FbHandeler.getallMatch();
    setMatchListModel(_doc);
    notifyListeners();
    setLoading(false);
  }
  getSemiMatchesData() async {
    setLoading(true);
    final _doc = await FbHandeler.getallMatch(type: Matchtype.semi);
    setSemiMatchListModel(_doc);
    notifyListeners();
    setLoading(false);
  }

  getFinalMatchesData() async {
    setLoading(true);
    final _doc = await FbHandeler.getallMatch(type: Matchtype.mfinal);
    setFinalMatchListModel(_doc);
    notifyListeners();
    setLoading(false);
  }
}
