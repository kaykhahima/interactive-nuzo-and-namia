import 'package:flutter/material.dart';
import 'package:interactive_nuzo_and_namia/features/game/model/item_model.dart';
import 'package:interactive_nuzo_and_namia/features/game/view_model/game_view_model.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({super.key, required this.item});

  final ItemModel item;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(builder: (context, gameViewModel, _) {
      final isSelected = gameViewModel.selectedItem == widget.item;
      return Container(
        height: 120,
        width: 150,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.surface,
            width: isSelected ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            gameViewModel.selectItem(widget.item);
            gameViewModel.checkCombination();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.item.imagePath,
                height: 100,
              ),
            ],
          ),
        ),
      );
    });
  }
}
