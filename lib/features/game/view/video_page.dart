import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/game_model.dart';
import '../view_model/game_view_model.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key, required this.scene});

  final VideoScene scene;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late Future _initializeVideoFuture;

  @override
  void initState() {
    super.initState();
    _initializeVideoFuture = _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    final gameViewModel = context.read<GameViewModel>();
    await gameViewModel.initializeVideo();

    //delay for a second
    await Future.delayed(const Duration(seconds: 1));

    _playVideo(widget.scene);
  }

  _playVideo(VideoScene scene) {
    final gameViewModel = context.read<GameViewModel>();

    if (scene == VideoScene.openScene) {
      _playOpeningScene(gameViewModel);
    } else {
      _playClosingScene(gameViewModel);
    }
  }

  _playOpeningScene(GameViewModel gameViewModel) {
    const startDuration = Duration(minutes: 4, seconds: 5);
    const endDuration = Duration(minutes: 4, seconds: 55);

    gameViewModel.playOpeningCutscene(
      start: startDuration,
      end: endDuration,
    );
  }

  _playClosingScene(GameViewModel gameViewModel) {
    const duration = Duration(minutes: 8, seconds: 20);
    gameViewModel.playClosingScene(duration: duration);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.shadow,
      body: FutureBuilder(
          future: _initializeVideoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('An error occurred!'),
              );
            }

            return Consumer<GameViewModel>(
                builder: (context, gameViewModel, _) {
              return Chewie(controller: gameViewModel.chewieController);
            });
          }),
    );
  }
}
