import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:interactive_nuzo_and_namia/features/game/model/item_model.dart';
import 'package:interactive_nuzo_and_namia/helpers/helper_methods.dart';
import 'package:interactive_nuzo_and_namia/utils/constants.dart';
import 'package:video_player/video_player.dart';

import '../model/combination_model.dart';
import '../model/game_model.dart';

/// This class binds the game model to the game view. The game view listens to this class for updates
/// It is responsible for getting the items and combinations from the game model and exposes the data to the UI
class GameViewModel extends ChangeNotifier {
  // Get an instance of the game model
  final model = GetIt.I<GameModel>();

  // List of items and its getter.
  // These are the items retrieved from the server that the player selects from
  List<ItemModel> _items = [];
  List<ItemModel> get items => _items;

  // Selected item and its getter.
  // This is the item that the player selects
  ItemModel? _selectedItem;
  ItemModel? get selectedItem => _selectedItem;

  // These are the combinations retrieved from the server that the player has to match with the correct item
  List<CombinationModel> _combinations = [];
  List<CombinationModel> get combinations => _combinations;

  // This is the current combination that the player has to match with the correct item
  CombinationModel? _currentCombination;
  CombinationModel? get currentCombination => _currentCombination;

  // Chewie controller and video player controller
  late ChewieController _chewieController;
  ChewieController get chewieController => _chewieController;

  late VideoPlayerController _videoPlayerController;
  VideoPlayerController get videoPlayerController => _videoPlayerController;

  // Flag to determine if the opening scene has ended
  bool _hasOpeningSceneEnded = false;
  bool get hasOpeningSceneEnded => _hasOpeningSceneEnded;

  // Flag to determine if the game has been completed
  bool _hasGameBeenCompleted = false;
  bool get hasGameBeenCompleted => _hasGameBeenCompleted;

  // Fetches items from the server. If there is an error, it shows a snackbar with the error message
  Future<void> getItems() async {
    try {
      final items = await model.getItems();
      _items = items;
    } catch (e) {
      AppHelpers.showSnackbar(message: e.toString(), color: Colors.red);
      if (kDebugMode) {
        print(e);
      }
    }
    notifyListeners();
  }

  // Fetches combinations from the server. If there is an error, it shows a snackbar with the error message
  Future<void> getCombinations() async {
    try {
      final combinations = await model.getCombinations();
      _combinations = combinations;
    } catch (e) {
      AppHelpers.showSnackbar(message: e.toString(), color: Colors.red);
      if (kDebugMode) {
        print(e);
      }
    }
    notifyListeners();
  }

  // Method called when a player selects an item.
  // It sets the selected item and notifies the listeners
  void selectItem(ItemModel item) {
    _selectedItem = item;
    notifyListeners();
  }

  // Called when the player selects the correct item/combination.
  // It clears the selected item and notifies the listeners
  void clearSelectedItem() {
    _selectedItem = null;
    notifyListeners();
  }

  // Sets the initial combination to the first combination in the list
  void setInitialCombination() {
    _currentCombination = _combinations.first;
    notifyListeners();
  }

  // Proceeds to the next combination in the list.
  // If the current combination is the last combination in the list, the game is completed
  void nextCombination() {
    final currentIndex = _combinations.indexOf(_currentCombination!);
    if (currentIndex < _combinations.length - 1) {
      _currentCombination = _combinations[currentIndex + 1];
    } else {
      _completeGame();
    }
    notifyListeners();
  }

  // Called when the player matches the final combination with the correct item.
  // Sets the flag to indicate that the game has been completed
  void _completeGame() {
    _hasGameBeenCompleted = true;
    notifyListeners();
  }

  // Method to check if the selected item matches the correct item in the current combination
  void checkCombination() {
    if (_selectedItem?.uuid == _currentCombination!.correctItemUuid) {
      // Show wrong dialog
      AppHelpers.showSnackbar(color: Colors.green, message: 'Correct answer!');

      //delay for 3 seconds, then clear the selected item and proceed to the next combination
      // gives time to the player to see if they've selected the correct/incorrect item
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

  // Initializes the video player and chewie controller
  Future<void> initializeVideo() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(AppConstants.nuzoAndNamiaVideoUrl),
    );

    await _videoPlayerController.initialize();

    // Initialize chewie controller. More options are available to customize the chewie controller
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      fullScreenByDefault: true, // set to true to play video in full screen
      allowedScreenSleep:
          false, // set to false to prevent the screen from sleeping
      allowPlaybackSpeedChanging:
          false, // set to false to prevent changing the playback speed
      showOptions: false, // set to false to hide the options button
      showControls: false, // set to false to hide the controls
    );

    // Set landscape orientation
    _setLandscape();
  }

  void _setLandscape() {
    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Hide system overlays. Status bar and bottom navigation bar for Android
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // Plays the opening cutscene from the start to the end duration.
  // When the end duration is reached, the opening scene has ended and the flag is set to true
  Future<void> playOpeningCutscene({
    required Duration start,
    required Duration end,
  }) async {
    _chewieController.seekTo(start);
    _chewieController.play();

    _videoPlayerController.addListener(() async {
      if (_chewieController.videoPlayerController.value.position >= end) {
        _hasOpeningSceneEnded = true;
        _chewieController.pause();
        notifyListeners();
      }
    });
  }

  // Plays the closing scene from its specific duration/timestamp
  void playClosingScene({required Duration duration}) {
    _chewieController.seekTo(duration);
    _chewieController.play();
  }

  // Disposes the video player and chewie controller
  void disposeVideo() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
