import 'package:dart_mappable/dart_mappable.dart';

part 'item_model.mapper.dart';

@MappableClass()
class ItemModel with ItemModelMappable {
  final String name;
  final String imagePath;

  ItemModel({
    required this.name,
    required this.imagePath,
  });
}
