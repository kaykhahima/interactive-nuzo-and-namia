import 'package:dart_mappable/dart_mappable.dart';

part 'item_model.mapper.dart';

/// Item model.
/// This class is responsible for holding the item model data.

@MappableClass()
class ItemModel with ItemModelMappable {
  /// UUID of the item.
  final String uuid;

  /// Name of the item.
  final String name;

  /// UUID of the image.
  final String imageUuid;

  ItemModel({
    required this.uuid,
    required this.name,
    required this.imageUuid,
  });
}
