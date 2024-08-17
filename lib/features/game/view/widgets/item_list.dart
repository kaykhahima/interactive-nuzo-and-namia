import 'package:flutter/material.dart';
import 'package:interactive_nuzo_and_namia/features/game/view/widgets/item_tile.dart';
import 'package:provider/provider.dart';

import '../../view_model/game_view_model.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Consumer<GameViewModel>(
        builder: (context, gameViewModel, _) {
          final items = gameViewModel.items;
          return ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = items[index];
              return ItemTile(item: item);
            },
          );
        },
      ),
    );
  }
}
