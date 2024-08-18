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
class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Consumer<GameViewModel>(builder: (context, gameViewModel, _) {
          return gameViewModel.hasOpeningSceneEnded &&
                  !gameViewModel.hasGameBeenCompleted
              ? const GamePlayScreen()
              : VideoScreen(
                  scene: gameViewModel.hasGameBeenCompleted
                      ? VideoScene.closeScene
                      : VideoScene.openScene,
                );
        }),
      ),
    );
  }
}
