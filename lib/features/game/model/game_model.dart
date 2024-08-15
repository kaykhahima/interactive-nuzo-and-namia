import '../../../resources/resources.dart';
import 'combination_model.dart';
import 'item_model.dart';

class GameModel {
  //A method to fetch items. Mocks an API call by adding a delay of 1 second
  Future<List<ItemModel>> getItems() async {
    try {
      return Future.delayed(const Duration(seconds: 1), () {
        return items;
      });
    } catch (e) {
      throw 'An error occurred while fetching items';
    }
  }

  //A method to fetch combinations. Mocks an API call by adding a delay of 1 second
  Future<List<CombinationModel>> getCombinations() async {
    try {
      return Future.delayed(const Duration(seconds: 1), () {
        return combinations;
      });
    } catch (e) {
      throw 'An error occurred while fetching combinations';
    }
  }
}

//a static list of items, but typically this one will be fetched from an API
List<ItemModel> items = [
  ItemModel(name: 'Baobab tree', imagePath: Images.baobabTree),
  ItemModel(name: 'Bean', imagePath: Images.bean),
  ItemModel(name: 'Drum', imagePath: Images.drum),
  ItemModel(name: 'Ice cream', imagePath: Images.iceCream),
  ItemModel(name: 'Mango', imagePath: Images.mango),
  ItemModel(name: 'Fabric', imagePath: Images.fabric),
  ItemModel(name: 'Grass', imagePath: Images.grass),
  ItemModel(name: 'Sun', imagePath: Images.sun),
  ItemModel(name: 'Lion', imagePath: Images.lion),
  ItemModel(name: 'Papaya', imagePath: Images.papaya),
  ItemModel(name: 'Rice', imagePath: Images.rice),
  ItemModel(name: 'Trumpet', imagePath: Images.trumpet),
];

//a static list of combinations, but typically this one will be fetched from an API
List<CombinationModel> combinations = [
  CombinationModel(
    description: 'Cold, Sweet and makes you happy',
    correctItem: items[3],
  ),
  CombinationModel(
    description: 'Bright, Hot and makes you sweat',
    correctItem: items[7],
  ),
  CombinationModel(
    description: 'Loud, Smooth and makes you dance',
    correctItem: items[2],
  ),
];
