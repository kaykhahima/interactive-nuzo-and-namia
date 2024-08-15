import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../view_model/game_view_model.dart';
import 'combination_tile.dart';

//this page shows the list of combinations in order.
//if the player selects the correct item based on what the combination description is, the player will be able to move to the next combination.
//if the player selects the wrong item, the player will be shown a dialog that says "wrong answer" and the player will be able to try again.
//if the player selects the correct item, the player will be shown a dialog that says "correct answer" and the player will be able to move to the next combination.

class CombinationList extends StatefulWidget {
  const CombinationList({super.key});

  @override
  State<CombinationList> createState() => _CombinationListState();
}

class _CombinationListState extends State<CombinationList> {
  late Future _combinationsFuture;

  @override
  void initState() {
    super.initState();
    _combinationsFuture = _fetchCombinations();
  }

  Future _fetchCombinations() async {
    //todo: refactor this - call it when the video begins
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);
    // Fetch combinations
    final gameViewModel = context.read<GameViewModel>();
    await gameViewModel.getCombinations();
    gameViewModel.setInitialCombination();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _combinationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred!'),
            );
          } else {
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
        });
  }
}
