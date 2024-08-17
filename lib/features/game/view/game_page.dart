import 'package:flutter/material.dart';
import 'package:interactive_nuzo_and_namia/features/game/model/game_model.dart';
import 'package:interactive_nuzo_and_namia/features/game/view/widgets/game_play_screen.dart';
import 'package:interactive_nuzo_and_namia/features/game/view/widgets/video_screen.dart';
import 'package:provider/provider.dart';

import '../view_model/game_view_model.dart';

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
