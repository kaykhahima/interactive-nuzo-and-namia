import 'package:dart_mappable/dart_mappable.dart';

part 'item_model.mapper.dart';

@MappableClass()
class ItemModel with ItemModelMappable {
  final String uuid;
  final String name;
  final String imageUuid;

  ItemModel({
    required this.uuid,
    required this.name,
    required this.imageUuid,
  });
}
