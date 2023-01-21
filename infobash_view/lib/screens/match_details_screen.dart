// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/initdata.dart';
import 'package:infobash_view/models/matchModel.dart';
import 'package:provider/provider.dart';

import 'package:infobash_view/models/ballModel.dart';
import 'package:infobash_view/services/firebase/fb_handeler.dart';

import '../constants/constraints.dart';
import '../view_model/view_model.dart';

class MatchDetailsScreen extends StatefulWidget {
  const MatchDetailsScreen({
    Key? key,
    required this.matchid,
  }) : super(key: key);
  final String matchid;
  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  late Future<MatchModel> futurematchdata;
  late Stream matchStream;
  late Stream ballStream;
  late String ballpath;
  @override
  void initState() {
    // futurematchdata = FbHandeler.getMatchModel(widget.matchid);
    matchStream = FirebaseFirestore.instance
        .collection(CollectionPath.matchpath)
        .doc(widget.matchid)
        .snapshots();
    ballStream = FirebaseFirestore.instance.collection(ballpath).snapshots();
    ballpath = CollectionPath.ballpath(widget.matchid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: StreamBuilder<dynamic>(
          stream: matchStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot documentSnapshot =
                  snapshot.data as DocumentSnapshot;
              var model = MatchModel.fromMap(documentSnapshot.id,
                  documentSnapshot.data() as Map<String, dynamic>);
              model.toMap();
              return Column(
                children: [
                  Text(model.datetime),
                  StreamBuilder(
                    stream: ballStream,
                    builder: (context, snapshotball) {
                      if (snapshot.hasData) {
                        return Text('Something went wrong');
                      }
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  )

                  // ListView.builder(
                  //     itemBuilder: (context, index) {
                  //       setState(() {});

                  //       return Text("id.toString()");
                  //     },
                  //     itemCount: matchViewModel.ballModel.length,
                  //     scrollDirection: Axis.vertical,
                  //     shrinkWrap: true)
                ],
              );
            }
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
