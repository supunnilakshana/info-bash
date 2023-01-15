import 'package:firebase_database/firebase_database.dart';
import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/models/groupModel.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';

import '../models/teammodel.dart';

class BaseService {
  initgroupdata(List<RegisterTeam> teamlist, int group) async {
    int gcount = (teamlist.length / group).round();

    int s = 0;
    int e = gcount;

    for (var i = 1; i <= group; i++) {
      final glist = teamlist.sublist(s, e);
      final gmodel = GroupModel(name: groupnamelist[i - 1], teamlist: teamlist);
      await FbHandeler.createDocAuto(gmodel.toMap(), CollectionPath.grouppath);
      s = e;
      int c = e + gcount;
      if (teamlist.length - c >= gcount) {
        e = c;
      } else {
        e = teamlist.length;
      }
    }
  }
}
