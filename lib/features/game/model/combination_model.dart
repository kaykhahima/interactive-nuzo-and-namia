import 'package:dart_mappable/dart_mappable.dart';

part 'combination_model.mapper.dart';

/// Combination model.
/// This class is responsible for holding the combination model data.

@MappableClass()
class CombinationModel with CombinationModelMappable {
  /// List of tags.
  final List<String> tags;

  /// UUID of the item that corresponds to the correct combination.
  final String correctItemUuid;

  CombinationModel({
    required this.tags,
    required this.correctItemUuid,
  });
}
