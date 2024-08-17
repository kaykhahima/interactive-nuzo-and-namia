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
    }
    return _instance!;
  }

  @override
  final String id = 'CombinationModel';

  static List<String> _$tags(CombinationModel v) => v.tags;
  static const Field<CombinationModel, List<String>> _f$tags =
      Field('tags', _$tags);
  static String _$correctItemUuid(CombinationModel v) => v.correctItemUuid;
  static const Field<CombinationModel, String> _f$correctItemUuid =
      Field('correctItemUuid', _$correctItemUuid);

  @override
  final MappableFields<CombinationModel> fields = const {
    #tags: _f$tags,
    #correctItemUuid: _f$correctItemUuid,
  };

  static CombinationModel _instantiate(DecodingData data) {
    return CombinationModel(
        tags: data.dec(_f$tags), correctItemUuid: data.dec(_f$correctItemUuid));
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  $R call({List<String>? tags, String? correctItemUuid});
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v));
  @override
  $R call({List<String>? tags, String? correctItemUuid}) =>
      $apply(FieldCopyWithData({
        if (tags != null) #tags: tags,
        if (correctItemUuid != null) #correctItemUuid: correctItemUuid
      }));
  @override
  CombinationModel $make(CopyWithData data) => CombinationModel(
      tags: data.get(#tags, or: $value.tags),
      correctItemUuid: data.get(#correctItemUuid, or: $value.correctItemUuid));

  @override
  CombinationModelCopyWith<$R2, CombinationModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CombinationModelCopyWithImpl($value, $cast, t);
}
