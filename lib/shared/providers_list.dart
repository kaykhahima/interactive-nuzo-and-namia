import 'package:interactive_nuzo_and_namia/features/game/view_model/game_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => GameViewModel()),
];
