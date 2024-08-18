import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import '../../../core/network/network_info.dart';
import '../../../utils/constants.dart';
import 'combination_model.dart';
import 'item_model.dart';

///Game Model
/// This class is responsible for fetching items and combinations from the database.
class GameModel {
  /// Appwrite client
  final Client client;

  /// Appwrite database
  final Databases database;

  /// Network info
  final NetworkInfo networkInfo;

  GameModel({
    required this.client,
    required this.database,
    required this.networkInfo,
  });

  // Fetches and returns items from Appwrite database
  Future<List<ItemModel>> getItems() async {
    List<ItemModel> items = [];

    // checks if there is an internet connection. throws an error if no internet
    if (!await networkInfo.isConnected) {
      throw 'No internet connection';
    }

    //get items from appwrite database
    try {
      DocumentList result = await database.listDocuments(
        databaseId: AppConstants.databaseId,
        collectionId: AppConstants.itemsCollectionId, // optional
      );

      // iterates through the result and adds the items to the items list
      for (Document doc in result.documents) {
        items.add(ItemModel(
          uuid: doc.data['\$id'],
          name: doc.data['name'],
          imageUuid: doc.data['imageUuid'],
        ));
      }

      // returns the items
      return items;
    } on AppwriteException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  // Fetches and returns combinations from the appwrite server
  Future<List<CombinationModel>> getCombinations() async {
    List<CombinationModel> combinations = [];

    // checks if there is an internet connection
    if (!await networkInfo.isConnected) {
      throw 'No internet connection';
    }

    //get combinations from appwrite database
    try {
      DocumentList result = await database.listDocuments(
        databaseId: AppConstants.databaseId,
        collectionId: AppConstants.combinationsCollectionId, // optional
      );

      // iterates through the result and adds the combinations to the combinations list
      for (Document doc in result.documents) {
        combinations.add(CombinationModel(
          tags: List<String>.from(doc.data['tags']),
          correctItemUuid: doc.data['correctItemUuid'],
        ));
      }

      // return the list of combinations
      return combinations;
    } on AppwriteException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}

// enum to represent the video scene.
// if openScene, the video player plays the opening scene. if closeScene, the video player plays the closing scene.
enum VideoScene { openScene, closeScene }
