import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import '../../../core/network/network_info.dart';
import '../../../utils/constants.dart';
import 'combination_model.dart';
import 'item_model.dart';

class GameModel {
  final Client client;
  final Databases database;
  final NetworkInfo networkInfo;

  GameModel({
    required this.client,
    required this.database,
    required this.networkInfo,
  });

  //A method to fetch items. Mocks an API call by adding a delay of 1 second
  Future<List<ItemModel>> getItems() async {
    List<ItemModel> items = [];

    if (!await networkInfo.isConnected) {
      throw 'No internet connection';
    }

    //get items from appwrite database
    try {
      DocumentList result = await database.listDocuments(
        databaseId: AppConstants.databaseId,
        collectionId: AppConstants.itemsCollectionId, // optional
      );

      for (Document doc in result.documents) {
        items.add(ItemModel(
          uuid: doc.data['\$id'],
          name: doc.data['name'],
          imageUuid: doc.data['imageUuid'],
        ));
      }
      return items;
    } on AppwriteException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  //A method to fetch combinations. Mocks an API call by adding a delay of 1 second
  Future<List<CombinationModel>> getCombinations() async {
    List<CombinationModel> combinations = [];

    if (!await networkInfo.isConnected) {
      throw 'No internet connection';
    }

    //get combinations from appwrite database
    try {
      DocumentList result = await database.listDocuments(
        databaseId: AppConstants.databaseId,
        collectionId: AppConstants.combinationsCollectionId, // optional
      );

      for (Document doc in result.documents) {
        combinations.add(CombinationModel(
          tags: List<String>.from(doc.data['tags']),
          correctItemUuid: doc.data['correctItemUuid'],
        ));
      }
      return combinations;
    } on AppwriteException catch (e) {
      print(e.toString());
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}

enum VideoScene { openScene, closeScene }
