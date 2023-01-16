import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:infobash_admin/models/teammodel.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';


class ViewModel extends ChangeNotifier {
  bool _loading = false;
  List<RegisterTeam> _registerTeam = [];
  RegisterTeam? _selectedTeam;


  bool get loading => _loading;
  List<RegisterTeam> get registerTeam => _registerTeam;
  RegisterTeam? get selectedTeam => _selectedTeam;


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


  getTeamsData() async {
    setLoading(true);
    final _doc = await FbHandeler.getallTeam();
    setTeamListModel(_doc);
    setLoading(false);
  }
}
