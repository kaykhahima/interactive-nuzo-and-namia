import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/game_view_model.dart';
import 'combination_tile.dart';

//this page shows the list of combinations in order.
//if the player selects the correct item based on what the combination description is, the player will be able to move to the next combination.
//if the player selects the wrong item, the player will be shown a dialog that says "wrong answer" and the player will be able to try again.
//if the player selects the correct item, the player will be shown a dialog that says "correct answer" and the player will be able to move to the next combination.

class CombinationList extends StatelessWidget {
  const CombinationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Consumer<GameViewModel>(
        builder: (context, gameViewModel, _) {
          final currentCombination = gameViewModel.currentCombination;
          return CombinationTile(combination: currentCombination!);
        },
      ),
    );
  }
}
