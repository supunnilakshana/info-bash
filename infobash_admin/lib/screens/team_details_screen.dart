import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infobash_admin/constants/navigation_utils.dart';
import 'package:infobash_admin/screens/components/buttons.dart';
import 'package:provider/provider.dart';
import '../constants/constraints.dart';
import '../models/view_model/view_model.dart';
import 'components/app_loading.dart';
import 'components/player_card/player_card.dart';

class TeamDetailsScreen extends StatefulWidget {
  const TeamDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Players of ${viewModel.selectedTeam!.teamName.toString().capitalize}'),
          toolbarHeight: size.height * 0.09,
          backgroundColor: kPrimaryColordark,
          actions: [
            Image.asset("assets/icons/app_icon.png"),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            _ui(viewModel),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Genaralbutton(

                    onpress: () async {
                      viewModel.update();
                      openMail(context);
                    },
                    pleft: 30,
                    pright: 30,
                    text: "Accept",
                  ),
                  Genaralbutton(
                    onpress: () {
                      openMail(context);
                    },
                    text: "Reject",
                    pleft: 30,
                    pright: 30,
                  )
                ],
              ),
            )
          ]),
        ));
  }

  _ui(ViewModel viewModel) {
    if (viewModel.loading) {
      return Container(child: AppLoading());
    }
    return PlayerRow(viewModel: viewModel);
  }
}
