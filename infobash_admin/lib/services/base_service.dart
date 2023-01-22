import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/models/groupModel.dart';
import 'package:infobash_admin/models/matchModel.dart';
import 'package:infobash_admin/models/point_tablemode.dart';
import 'package:infobash_admin/services/date_time/date.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';
import 'package:trotter/trotter.dart';

import '../models/teammodel.dart';

class BaseService {
  initgroupdata(int group) async {
    List<RegisterTeam> tempteamlist = await FbHandeler.getallTeam();
    List<RegisterTeamDto> teamlist = [];

    for (var element in tempteamlist) {
      //print(element.teamName);
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
    final tl1 = [teamlist[11], teamlist[5], teamlist[2]];
    final tl2 = [teamlist[4], teamlist[6], teamlist[7]];
    final tl3 = [teamlist[8], teamlist[3], teamlist[9]];
    final tl4 = [teamlist[0], teamlist[1], teamlist[10]];
    int gcount = (teamlist.length / group).round();
    final ml = [tl1, tl2, tl3, tl4];
    int s = 0;
    int e = gcount;

    for (var i = 1; i <= group; i++) {
      List<dynamic> teamlistd = [];
      List<dynamic> pointtable = [];
      final glist = ml[i - 1]; // teamlist.sublist(s, e);
      for (var element in glist) {
        pointtable.add(PoinTableModel(
                team: element,
                point: 0,
                played: 0,
                win: 0,
                loss: 0,
                notres: 0,
                nrr: 0.0)
            .toMap());
      }
      final gmodel = GroupModel(
        name: groupnamelist[i - 1],
        teamlist: glist,
      );
      for (var element in glist) {
        teamlistd.add(element.toMap());
      }
      await FbHandeler.createDocAuto(
          gmodel.toMap(tlist: teamlistd, plist: pointtable),
          CollectionPath.grouppath);
      s = e;
      int c = e + gcount;
      if (teamlist.length - c >= gcount) {
        e = c;
      } else {
        e = teamlist.length;
      }
    }

    //     final gmodel1 = GroupModel(
    //       name: groupnamelist[0],
    //       teamlist: tl1,
    //     );
    //     final gmodel2 = GroupModel(
    //       name: groupnamelist[1],
    //       teamlist: tl1,
    //     );
    //     final gmodel3 = GroupModel(
    //       name: groupnamelist[2],
    //       teamlist: tl1,
    //     );
    //     final gmodel4 = GroupModel(
    //       name: groupnamelist[3],
    //       teamlist: tl1,
    //     );
    //  await FbHandeler.createDocAuto(
    //         gmodel1.toMap(tlist: teamlistd, plist: pointtable),
    //         CollectionPath.grouppath);
  }

  makeround1match({required int over, required int bpo}) async {
    final group = await FbHandeler.getallGroup();
    group.sort((a, b) => a.name.compareTo(b.name));
    int i = 1;
    final olist = [0, 3, 6, 9, 1, 4, 7, 10, 2, 5, 8, 11];
    for (var element in group) {
      final bagOfItems = element.teamlist!,
          combos = Combinations(2, bagOfItems);
      print(element.name);
      for (final combo in combos()) {
        print(combo[0].teamName + "---" + combo[1].teamName);

        final matchmodl = MatchModel(
            matchid: olist[i - 1] + 1,
            team1: combo[0],
            team2: combo[1],
            groupid: element.name,
            datetime: Date.getStringdatenow(),
            winteam: nodata,
            result: nodata,
            matchtype: Matchtype.round1,
            overs: over,
            bpo: bpo.toString(),
            matchstatus: Matchstatustype.notstared,
            tossdec: nodata,
            tosswin: nodata,
            inning1: nodata,
            inning2: nodata);
        i++;

        await FbHandeler.createDocAuto(
            matchmodl.toMap(), CollectionPath.matchsround1);
      }
      print(i);
    }
  }
}
