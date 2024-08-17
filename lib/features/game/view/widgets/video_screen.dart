import 'package:flutter/material.dart';

import '../../model/game_model.dart';
import '../video_page.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key, required this.scene});

  final VideoScene scene;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: VideoPage(scene: scene)),
        ],
      ),
    );
  }
}
