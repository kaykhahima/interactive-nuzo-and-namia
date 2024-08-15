import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:interactive_nuzo_and_namia/features/game/view/widgets/combination_list.dart';
import 'package:interactive_nuzo_and_namia/features/game/view/widgets/item_list.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CombinationList(),
              Gap(12.0),
              ItemList(),
            ],
          ),
        ),
      ),
    );
  }
}
