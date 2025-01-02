// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Setting _$SettingFromJson(Map<String, dynamic> json) {
  return SettingEntity.fromJson(json);
}

/// @nodoc
mixin _$Setting {
  String? get shop => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? shop, String? address, String? phone)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? shop, String? address, String? phone)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? shop, String? address, String? phone)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingEntity value) entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingEntity value)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingEntity value)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingCopyWith<Setting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingCopyWith<$Res> {
  factory $SettingCopyWith(Setting value, $Res Function(Setting) then) =
      _$SettingCopyWithImpl<$Res, Setting>;
  @useResult
  $Res call({String? shop, String? address, String? phone});
}

/// @nodoc
class _$SettingCopyWithImpl<$Res, $Val extends Setting>
    implements $SettingCopyWith<$Res> {
  _$SettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shop = freezed,
    Object? address = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingEntityImplCopyWith<$Res>
    implements $SettingCopyWith<$Res> {
  factory _$$SettingEntityImplCopyWith(
          _$SettingEntityImpl value, $Res Function(_$SettingEntityImpl) then) =
      __$$SettingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? shop, String? address, String? phone});
}

/// @nodoc
class __$$SettingEntityImplCopyWithImpl<$Res>
    extends _$SettingCopyWithImpl<$Res, _$SettingEntityImpl>
    implements _$$SettingEntityImplCopyWith<$Res> {
  __$$SettingEntityImplCopyWithImpl(
      _$SettingEntityImpl _value, $Res Function(_$SettingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shop = freezed,
    Object? address = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$SettingEntityImpl(
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingEntityImpl implements SettingEntity {
  const _$SettingEntityImpl({this.shop, this.address, this.phone});

  factory _$SettingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingEntityImplFromJson(json);

  @override
  final String? shop;
  @override
  final String? address;
  @override
  final String? phone;

  @override
  String toString() {
    return 'Setting.entity(shop: $shop, address: $address, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingEntityImpl &&
            (identical(other.shop, shop) || other.shop == shop) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shop, address, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingEntityImplCopyWith<_$SettingEntityImpl> get copyWith =>
      __$$SettingEntityImplCopyWithImpl<_$SettingEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? shop, String? address, String? phone)
        entity,
  }) {
    return entity(shop, address, phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? shop, String? address, String? phone)? entity,
  }) {
    return entity?.call(shop, address, phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? shop, String? address, String? phone)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(shop, address, phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingEntity value) entity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingEntity value)? entity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingEntity value)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingEntityImplToJson(
      this,
    );
  }
}

abstract class SettingEntity implements Setting {
  const factory SettingEntity(
      {final String? shop,
      final String? address,
      final String? phone}) = _$SettingEntityImpl;

  factory SettingEntity.fromJson(Map<String, dynamic> json) =
      _$SettingEntityImpl.fromJson;

  @override
  String? get shop;
  @override
  String? get address;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$SettingEntityImplCopyWith<_$SettingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
