import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:infobash_admin/models/matchModel.dart';
import 'package:infobash_admin/services/firebase/fb_handeler.dart';

import 'package:lottie/lottie.dart';

import '../../components/match_list_row.dart';
import '../../match/matchstarting/match_start_screen.dart';

class MatchShowScreen extends StatefulWidget {
  final String matchtype;
  const MatchShowScreen({Key? key, required this.matchtype}) : super(key: key);

  @override
  State<MatchShowScreen> createState() => _MatchShowScreenState();
}

class _MatchShowScreenState extends State<MatchShowScreen> {
  late Future<List<MatchModel>> futureData;
  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () => loaddata(),
      child: FutureBuilder(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MatchModel> data = snapshot.data as List<MatchModel>;

            if (data.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    MatchModel matchModel = data[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MatchStartedScreen(
                                      matchModelw: matchModel,
                                    )));
                      },
                      child: TeamListRow(
                        matchModel: matchModel,
                      ),
                    );
                  },
                  itemCount: data.length);
            } else {
              print(data.length);
              return Center(
                child: Lottie.asset("assets/animations/nodata.json",
                    width: size.height * 0.5),
              );
            }
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }

  loaddata() {
    futureData = FbHandeler.getallMatch(type: widget.matchtype);
  }
}
