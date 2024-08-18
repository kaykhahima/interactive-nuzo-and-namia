import 'package:flutter/material.dart';

import 'combination_list.dart';
import 'item_list.dart';

class GamePlayScreen extends StatelessWidget {
  const GamePlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CombinationList(),
          SizedBox(height: 12.0),
          ItemList(),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
