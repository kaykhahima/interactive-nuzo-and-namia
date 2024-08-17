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

class GameViewModel extends ChangeNotifier {
  final model = GetIt.I<GameModel>();

  List<ItemModel> _items = [];
  List<ItemModel> get items => _items;

  ItemModel? _selectedItem;
  ItemModel? get selectedItem => _selectedItem;

  List<CombinationModel> _combinations = [];
  List<CombinationModel> get combinations => _combinations;

  CombinationModel? _currentCombination;
  CombinationModel? get currentCombination => _currentCombination;

  late ChewieController _chewieController;
  ChewieController get chewieController => _chewieController;

  late VideoPlayerController _videoPlayerController;
  VideoPlayerController get videoPlayerController => _videoPlayerController;

  bool _hasOpeningSceneEnded = false;
  bool get hasOpeningSceneEnded => _hasOpeningSceneEnded;

  bool _hasGameBeenCompleted = false;
  bool get hasGameBeenCompleted => _hasGameBeenCompleted;

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
    _hasGameBeenCompleted = true;
    notifyListeners();
  }

  void checkCombination() {
    if (_selectedItem?.uuid == _currentCombination!.correctItemUuid) {
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

  Future<void> initializeVideo() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(AppConstants.nuzoAndNamiaVideoUrl),
    );

    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      fullScreenByDefault: true,
      allowedScreenSleep: false,
      allowPlaybackSpeedChanging: false,
      showOptions: false,
      showControls: true,
    );

    _setLandscape();
  }

  void _setLandscape() {
    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  Future<void> playOpeningCutscene({
    required Duration start,
    required Duration end,
  }) async {
    await _videoPlayerController.seekTo(start);
    await _videoPlayerController.play();

    _videoPlayerController.addListener(() async {
      if (_videoPlayerController.value.position >= end) {
        await _chewieController.pause();
        _hasOpeningSceneEnded = true;
        notifyListeners();
      }
    });
  }

  void playClosingScene({required Duration duration}) {
    _chewieController.seekTo(duration);
    _chewieController.play();
  }
}
