// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'item_model.dart';

class ItemModelMapper extends ClassMapperBase<ItemModel> {
  ItemModelMapper._();

  static ItemModelMapper? _instance;
  static ItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ItemModel';

  static String _$uuid(ItemModel v) => v.uuid;
  static const Field<ItemModel, String> _f$uuid = Field('uuid', _$uuid);
  static String _$name(ItemModel v) => v.name;
  static const Field<ItemModel, String> _f$name = Field('name', _$name);
  static String _$imageUuid(ItemModel v) => v.imageUuid;
  static const Field<ItemModel, String> _f$imageUuid =
      Field('imageUuid', _$imageUuid);

  @override
  final MappableFields<ItemModel> fields = const {
    #uuid: _f$uuid,
    #name: _f$name,
    #imageUuid: _f$imageUuid,
  };

  static ItemModel _instantiate(DecodingData data) {
    return ItemModel(
        uuid: data.dec(_f$uuid),
        name: data.dec(_f$name),
        imageUuid: data.dec(_f$imageUuid));
  }

  @override
  final Function instantiate = _instantiate;

  static ItemModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemModel>(map);
  }

  static ItemModel fromJson(String json) {
    return ensureInitialized().decodeJson<ItemModel>(json);
  }
}

mixin ItemModelMappable {
  String toJson() {
    return ItemModelMapper.ensureInitialized()
        .encodeJson<ItemModel>(this as ItemModel);
  }

  Map<String, dynamic> toMap() {
    return ItemModelMapper.ensureInitialized()
        .encodeMap<ItemModel>(this as ItemModel);
  }

  ItemModelCopyWith<ItemModel, ItemModel, ItemModel> get copyWith =>
      _ItemModelCopyWithImpl(this as ItemModel, $identity, $identity);
  @override
  String toString() {
    return ItemModelMapper.ensureInitialized()
        .stringifyValue(this as ItemModel);
  }

  @override
  bool operator ==(Object other) {
    return ItemModelMapper.ensureInitialized()
        .equalsValue(this as ItemModel, other);
  }

  @override
  int get hashCode {
    return ItemModelMapper.ensureInitialized().hashValue(this as ItemModel);
  }
}

extension ItemModelValueCopy<$R, $Out> on ObjectCopyWith<$R, ItemModel, $Out> {
  ItemModelCopyWith<$R, ItemModel, $Out> get $asItemModel =>
      $base.as((v, t, t2) => _ItemModelCopyWithImpl(v, t, t2));
}

abstract class ItemModelCopyWith<$R, $In extends ItemModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? uuid, String? name, String? imageUuid});
  ItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemModel, $Out>
    implements ItemModelCopyWith<$R, ItemModel, $Out> {
  _ItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemModel> $mapper =
      ItemModelMapper.ensureInitialized();
  @override
  $R call({String? uuid, String? name, String? imageUuid}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (name != null) #name: name,
        if (imageUuid != null) #imageUuid: imageUuid
      }));
  @override
  ItemModel $make(CopyWithData data) => ItemModel(
      uuid: data.get(#uuid, or: $value.uuid),
      name: data.get(#name, or: $value.name),
      imageUuid: data.get(#imageUuid, or: $value.imageUuid));

  @override
  ItemModelCopyWith<$R2, ItemModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ItemModelCopyWithImpl($value, $cast, t);
}
