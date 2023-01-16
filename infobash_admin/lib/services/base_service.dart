import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/models/groupModel.dart';
import 'package:infobash_admin/models/matchModel.dart';
import 'package:infobash_admin/services/date_time/date.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';
import 'package:trotter/trotter.dart';

import '../models/teammodel.dart';

class BaseService {
  initgroupdata(int group) async {
    List<RegisterTeam> tempteamlist = await FbHandeler.getallTeam();
    List<RegisterTeamDto> teamlist = [];
    for (var element in tempteamlist) {
      teamlist.add(RegisterTeamDto(
          teamId: element.teamId!,
          teamName: element.teamName,
          email: element.email,
          phoneNumber: element.phoneNumber,
          leaderName: element.leaderName,
          academicYear: element.academicYear,
          mPlayer1: element.mPlayer1,
          mPlayer2: element.mPlayer2,
          mPlayer3: element.mPlayer3,
          mPlayer4: element.mPlayer4,
          mPlayer5: element.mPlayer5,
          mPlayer6: element.mPlayer6,
          fPlayer1: element.fPlayer1,
          fPlayer2: element.fPlayer2,
          fPlayer3: element.fPlayer3,
          accept: element.accept));
    }
    int gcount = (teamlist.length / group).round();

    int s = 0;
    int e = gcount;

    for (var i = 1; i <= group; i++) {
      List<dynamic> teamlistd = [];
      final glist = teamlist.sublist(s, e);
      final gmodel = GroupModel(name: groupnamelist[i - 1], teamlist: glist);
      for (var element in glist) {
        teamlistd.add(element.toMap());
      }
      await FbHandeler.createDocAuto(
          gmodel.toMap(tlist: teamlistd), CollectionPath.grouppath);
      s = e;
      int c = e + gcount;
      if (teamlist.length - c >= gcount) {
        e = c;
      } else {
        e = teamlist.length;
      }
    }
  }

  makeround1match({required int over, required int bpo}) async {
    final group = await FbHandeler.getallGroup();
    int i = 1;
    for (var element in group) {
      final bagOfItems = group[0].teamlist!,
          combos = Combinations(2, bagOfItems);

      for (final combo in combos()) {
        final matchmodl = MatchModel(
            matchid: i,
            team1: combo[0],
            team2: combo[1],
            groupid: element.name,
            datetime: Date.getStringdatenow(),
            winteam: nodata,
            result: nodata,
            matchtype: Matchtype.round1,
            overs: over,
            bpo: bpo);
        i++;

        await FbHandeler.createDocAuto(
            matchmodl.toMap(), CollectionPath.matchsround1);
      }
    }
    print(i);
  }
}
