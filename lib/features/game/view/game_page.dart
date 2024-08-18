import 'package:flutter/material.dart';
import 'package:interactive_nuzo_and_namia/features/game/model/game_model.dart';
import 'package:interactive_nuzo_and_namia/features/game/view/widgets/game_play_screen.dart';
import 'package:interactive_nuzo_and_namia/features/game/view/widgets/video_screen.dart';
import 'package:provider/provider.dart';

import '../view_model/game_view_model.dart';

/// This page is a wrapper for the game play screen and the video screen.
/// It listens to the game view model to determine which screen to show.
/// If the opening scene has not been played, the video screen is shown playing the opening scene
/// If the opening scene has ended and the game is not yet completed, the game play screen is shown. This is where the player selects the correct combination
/// If the game has been completed, the video screen is shown playing the closing scene
class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Future _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
  }

  //get combinations and items
  Future _loadData() async {
    try {
      final gameViewModel = context.read<GameViewModel>();

      // Fetch combinations and set initial combination
      await gameViewModel.getCombinations();
      gameViewModel.setInitialCombination();

      // Fetch items
      await gameViewModel.getItems();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: FutureBuilder(
            future: _loadDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              return Consumer<GameViewModel>(
                  builder: (context, gameViewModel, _) {
                return gameViewModel.hasOpeningSceneEnded &&
                        !gameViewModel.hasGameBeenCompleted
                    ? const GamePlayScreen()
                    : VideoScreen(
                        scene: gameViewModel.hasGameBeenCompleted
                            ? VideoScene.closeScene
                            : VideoScene.openScene,
                      );
              });
            }),
      ),
    );
  }
}
