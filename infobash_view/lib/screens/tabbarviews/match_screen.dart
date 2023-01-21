import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/models/matchModel.dart';
import 'package:infobash_view/services/firebase/fb_handeler.dart';
import 'package:lottie/lottie.dart';

import '../../constants/navigation_utils.dart';
import '../components/match_list_row.dart';

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
              return Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        MatchModel matchModel = data[index];

                        return GestureDetector(
                          onTap: () {
                            openBallDetails(
                                context, matchModel.id!, matchModel);
                          },
                          child: ScheduleListRow(
                            matchModel: matchModel,
                          ),
                        );
                      },
                      itemCount: data.length));
            } else {
              Center(
                child: Lottie.asset("assets/animations/nodata.json",
                    width: size.height * 0.2),
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
