import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:infobash_admin/models/teammodel.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';

import '../matchModel.dart';


class ViewModel extends ChangeNotifier {
  bool _loading = false;
  List<RegisterTeam> _registerTeam = [];
  RegisterTeam? _selectedTeam;
  List<MatchModel> _matchModel = [];


  bool get loading => _loading;
  List<RegisterTeam> get registerTeam => _registerTeam;
  RegisterTeam? get selectedTeam => _selectedTeam;
  List<MatchModel> get matchModel => _matchModel;


  ViewModel() {
    getTeamsData();
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
    setLoading(false);
  }
}
