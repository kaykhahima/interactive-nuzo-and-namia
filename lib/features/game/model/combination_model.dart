import 'package:dart_mappable/dart_mappable.dart';
import 'package:interactive_nuzo_and_namia/features/game/model/item_model.dart';

part 'combination_model.mapper.dart';

@MappableClass()
class CombinationModel with CombinationModelMappable {
  final String description;
  final ItemModel correctItem;

  CombinationModel({
    required this.description,
    required this.correctItem,
  });
}
