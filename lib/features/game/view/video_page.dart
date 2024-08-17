import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
    const endDuration = Duration(minutes: 4, seconds: 8);

    gameViewModel.playOpeningCutscene(
      start: startDuration,
      end: endDuration,
    );
  }

  _playClosingScene(GameViewModel gameViewModel) {
    const duration = Duration(minutes: 14, seconds: 0);
    gameViewModel.playClosingScene(duration: duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return Center(
                child: gameViewModel.controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: gameViewModel.controller.value.aspectRatio,
                        child: VideoPlayer(gameViewModel.controller),
                      )
                    : const CircularProgressIndicator(),
              );
            });
          }),
    );
  }
}
