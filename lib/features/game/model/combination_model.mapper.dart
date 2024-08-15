// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'combination_model.dart';

class CombinationModelMapper extends ClassMapperBase<CombinationModel> {
  CombinationModelMapper._();

  static CombinationModelMapper? _instance;
  static CombinationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CombinationModelMapper._());
      ItemModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CombinationModel';

  static String _$description(CombinationModel v) => v.description;
  static const Field<CombinationModel, String> _f$description =
      Field('description', _$description);
  static ItemModel _$correctItem(CombinationModel v) => v.correctItem;
  static const Field<CombinationModel, ItemModel> _f$correctItem =
      Field('correctItem', _$correctItem);

  @override
  final MappableFields<CombinationModel> fields = const {
    #description: _f$description,
    #correctItem: _f$correctItem,
  };

  static CombinationModel _instantiate(DecodingData data) {
    return CombinationModel(
        description: data.dec(_f$description),
        correctItem: data.dec(_f$correctItem));
  }

  @override
  final Function instantiate = _instantiate;

  static CombinationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CombinationModel>(map);
  }

  static CombinationModel fromJson(String json) {
    return ensureInitialized().decodeJson<CombinationModel>(json);
  }
}

mixin CombinationModelMappable {
  String toJson() {
    return CombinationModelMapper.ensureInitialized()
        .encodeJson<CombinationModel>(this as CombinationModel);
  }

  Map<String, dynamic> toMap() {
    return CombinationModelMapper.ensureInitialized()
        .encodeMap<CombinationModel>(this as CombinationModel);
  }

  CombinationModelCopyWith<CombinationModel, CombinationModel, CombinationModel>
      get copyWith => _CombinationModelCopyWithImpl(
          this as CombinationModel, $identity, $identity);
  @override
  String toString() {
    return CombinationModelMapper.ensureInitialized()
        .stringifyValue(this as CombinationModel);
  }

  @override
  bool operator ==(Object other) {
    return CombinationModelMapper.ensureInitialized()
        .equalsValue(this as CombinationModel, other);
  }

  @override
  int get hashCode {
    return CombinationModelMapper.ensureInitialized()
        .hashValue(this as CombinationModel);
  }
}

extension CombinationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CombinationModel, $Out> {
  CombinationModelCopyWith<$R, CombinationModel, $Out>
      get $asCombinationModel =>
          $base.as((v, t, t2) => _CombinationModelCopyWithImpl(v, t, t2));
}

abstract class CombinationModelCopyWith<$R, $In extends CombinationModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ItemModelCopyWith<$R, ItemModel, ItemModel> get correctItem;
  $R call({String? description, ItemModel? correctItem});
  CombinationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CombinationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CombinationModel, $Out>
    implements CombinationModelCopyWith<$R, CombinationModel, $Out> {
  _CombinationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CombinationModel> $mapper =
      CombinationModelMapper.ensureInitialized();
  @override
  ItemModelCopyWith<$R, ItemModel, ItemModel> get correctItem =>
      $value.correctItem.copyWith.$chain((v) => call(correctItem: v));
  @override
  $R call({String? description, ItemModel? correctItem}) =>
      $apply(FieldCopyWithData({
        if (description != null) #description: description,
        if (correctItem != null) #correctItem: correctItem
      }));
  @override
  CombinationModel $make(CopyWithData data) => CombinationModel(
      description: data.get(#description, or: $value.description),
      correctItem: data.get(#correctItem, or: $value.correctItem));

  @override
  CombinationModelCopyWith<$R2, CombinationModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CombinationModelCopyWithImpl($value, $cast, t);
}
