import 'package:dart_mappable/dart_mappable.dart';

part 'combination_model.mapper.dart';

@MappableClass()
class CombinationModel with CombinationModelMappable {
  final List<String> tags;
  final String correctItemUuid;

  CombinationModel({
    required this.tags,
    required this.correctItemUuid,
  });
}
