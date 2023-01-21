import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infobash_view/screens/components/player_card/player_card_background.dart';

import '../../../view_model/view_model.dart';
import 'player_card_topic.dart';

class PlayerRow extends StatelessWidget {
  final ViewModel viewModel;

  const PlayerRow({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PlayerCardTopic(text: "Men"),
        PlayerCardBackground(text: viewModel.selectedTeam!.mPlayer1.name.capitalize.toString()),
        PlayerCardBackground(text: viewModel.selectedTeam!.mPlayer2.name.capitalize.toString()),
        PlayerCardBackground(text: viewModel.selectedTeam!.mPlayer3.name.capitalize.toString()),
        PlayerCardBackground(text: viewModel.selectedTeam!.mPlayer4.name.capitalize.toString()),
        PlayerCardBackground(text: viewModel.selectedTeam!.mPlayer5.name.capitalize.toString()),
        PlayerCardBackground(text: viewModel.selectedTeam!.mPlayer6.name.capitalize.toString()),
        const PlayerCardTopic(text: "Women"),
        PlayerCardBackground(text: viewModel.selectedTeam!.fPlayer1.name.capitalize.toString()),
        PlayerCardBackground(text: viewModel.selectedTeam!.fPlayer2.name.capitalize.toString()),
        PlayerCardBackground(text: viewModel.selectedTeam!.fPlayer3.name.capitalize.toString()),
      ],
    );
  }
}
