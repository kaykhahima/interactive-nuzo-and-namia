import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../view_model/game_view_model.dart';
import 'combination_list.dart';
import 'item_list.dart';

class GamePlayScreen extends StatefulWidget {
  const GamePlayScreen({super.key});

  @override
  State<GamePlayScreen> createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  late Future _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
  }

  Future _loadData() async {
    final gameViewModel = context.read<GameViewModel>();

    // Fetch combinations and set initial combination
    await gameViewModel.getCombinations();
    gameViewModel.setInitialCombination();

    // Fetch items
    await gameViewModel.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CombinationList(),
                  Gap(12.0),
                  ItemList(),
                ],
              ),
            );
          }
        });
  }
}
