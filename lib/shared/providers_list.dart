import 'package:interactive_nuzo_and_namia/features/game/view_model/game_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// List of providers used in the app. This is used to provide the view models to the UI
List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => GameViewModel()),
];
