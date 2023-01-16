import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/initdata.dart';
import 'package:infobash_admin/screens/components/buttons.dart';
import 'package:infobash_admin/services/base_service.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';

class RoundScheduleView extends StatefulWidget {
  const RoundScheduleView({super.key});

  @override
  State<RoundScheduleView> createState() => _RoundScheduleViewState();
}

class _RoundScheduleViewState extends State<RoundScheduleView> {
  late Future<bool> futureData;
  @override
  void initState() {
    futureData = FbHandeler.getRoundstatus(Matchtype.round1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool data = snapshot.data as bool;
            return Column(
              children: [
                Text(data ? "Scehduled" : "Not Scheduled"),
                Genaralbutton(
                  onpress: () async {
                    await FbHandeler.updateRoundstatus(Matchtype.round1);
                    if (data == false) {
                      await BaseService().initgroupdata(4);
                      await BaseService().makeround1match(over: 5, bpo: 4);
                      futureData = FbHandeler.getRoundstatus(Matchtype.round1);
                    }
                  },
                  text: "Scheduel  Round 1",
                )
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Somthing wrong!!"),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
