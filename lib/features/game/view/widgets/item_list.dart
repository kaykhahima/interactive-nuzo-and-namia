import 'package:flutter/material.dart';
import 'package:interactive_nuzo_and_namia/features/game/view/widgets/item_tile.dart';
import 'package:provider/provider.dart';

import '../../view_model/game_view_model.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late Future _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = _fetchItems();
  }

  Future _fetchItems() async {
    // Fetch combinations
    final gameViewModel = context.read<GameViewModel>();
    await gameViewModel.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred!'),
            );
          } else {
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
        });
  }
}
