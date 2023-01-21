import 'package:flutter/material.dart';
import 'package:infobash_view/models/ballModel.dart';
import 'package:infobash_view/services/firebase/fb_handeler.dart';
import 'package:provider/provider.dart';

import '../constants/constraints.dart';
import '../view_model/view_model.dart';

class MatchDetailsScreen extends StatefulWidget {
  const MatchDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    FbHandeler.getballs(matchid: id.toString());
    super.initState();
  }
  String? id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ViewModel matchViewModel = context.watch<ViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
        toolbarHeight: size.height * 0.09,
        backgroundColor: kPrimaryColordark,
        actions: [
          Image.asset("assets/icons/app_icon.png"),
        ],
      ),
      body: Column(

        children: [
          Text(matchViewModel.selectedMatch!.team1.teamName),
          ListView.builder(itemBuilder: (context,index){
            setState((){
              id = matchViewModel.selectedMatch!.id;
            });

            return Text(id.toString());
          },
          itemCount: matchViewModel.ballModel.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true)
        ],
      ),
    );
  }
}
