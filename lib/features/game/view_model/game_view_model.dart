import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interactive_nuzo_and_namia/features/game/model/item_model.dart';
import 'package:interactive_nuzo_and_namia/helpers/helper_methods.dart';

import '../model/combination_model.dart';
import '../model/game_model.dart';

class GameViewModel extends ChangeNotifier {
  final GameModel model = GameModel();

  List<ItemModel> _items = [];
  List<ItemModel> get items => _items;

  ItemModel? _selectedItem;
  ItemModel? get selectedItem => _selectedItem;

  List<CombinationModel> _combinations = [];
  List<CombinationModel> get combinations => _combinations;

  CombinationModel? _currentCombination;
  CombinationModel? get currentCombination => _currentCombination;

  Future<void> getItems() async {
    try {
      final items = await model.getItems();
      _items = items;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    notifyListeners();
  }

  Future<void> getCombinations() async {
    try {
      final combinations = await model.getCombinations();
      _combinations = combinations;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    notifyListeners();
  }

  void selectItem(ItemModel item) {
    _selectedItem = item;
    notifyListeners();
  }

  void clearSelectedItem() {
    _selectedItem = null;
    notifyListeners();
  }

  void setInitialCombination() {
    _currentCombination = _combinations.first;
    notifyListeners();
  }

  void nextCombination() {
    final currentIndex = _combinations.indexOf(_currentCombination!);
    if (currentIndex < _combinations.length - 1) {
      _currentCombination = _combinations[currentIndex + 1];
    } else {
      _completeGame();
    }
    notifyListeners();
  }

  void _completeGame() {
    // Show completion dialog
    AppHelpers.showSnackbar(
        color: Colors.green,
        message: 'Congratulations! You have completed the game.');

    //todo: proceed to the closing scene which will be extracted from the scene
    //todo: where Bubelang says finally i’m free and flies out, timestamp from 8:20.
  }

  void checkCombination() {
    if (_selectedItem == _currentCombination!.correctItem) {
      // Show wrong dialog
      AppHelpers.showSnackbar(color: Colors.green, message: 'Correct answer!');

      //delay for 3 seconds, then clear the selected item and proceed to the next combination
      Future.delayed(const Duration(seconds: 3)).then((_) {
        //clear the selected item
        clearSelectedItem();

        //proceed to the next combination
        nextCombination();
      });
    } else {
      // Show wrong dialog
      AppHelpers.showSnackbar(
          color: Colors.red, message: 'Incorrect. Please try again.');
    }
  }
}
