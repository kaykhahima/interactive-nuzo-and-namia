import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final gameViewModel = context.read<GameViewModel>();
    gameViewModel.controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
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
              return gameViewModel.controller.value.isInitialized
                  ? buildFullScreen(gameViewModel)
                  : const Center(child: CircularProgressIndicator());
            });
          }),
    );
  }

  Widget buildFullScreen(GameViewModel gameViewModel) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Center(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: width,
          height: height,
          child: AspectRatio(
            aspectRatio: gameViewModel.controller.value.aspectRatio,
            child: VideoPlayer(gameViewModel.controller),
          ),
        ),
      ),
    );
  }
}
