// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return OrderEntity.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  int? get totalPrice => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_id')
  int? get paymentMethodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_amount')
  int? get paidAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'change_amount')
  int? get changeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  PaymentMethodEntity? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  List<ProductItemOrderEntity> get items => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? id,
            String name,
            String? email,
            String? gender,
            String? phone,
            String? birthday,
            @JsonKey(name: 'total_price') int? totalPrice,
            String? notes,
            @JsonKey(name: 'payment_method_id') int? paymentMethodId,
            @JsonKey(name: 'paid_amount') int? paidAmount,
            @JsonKey(name: 'change_amount') int? changeAmount,
            @JsonKey(name: 'payment_method') PaymentMethodEntity? paymentMethod,
            @JsonKey(name: 'updated_at') String? updatedAt,
            List<ProductItemOrderEntity> items)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int? id,
            String name,
            String? email,
            String? gender,
            String? phone,
            String? birthday,
            @JsonKey(name: 'total_price') int? totalPrice,
            String? notes,
            @JsonKey(name: 'payment_method_id') int? paymentMethodId,
            @JsonKey(name: 'paid_amount') int? paidAmount,
            @JsonKey(name: 'change_amount') int? changeAmount,
            @JsonKey(name: 'payment_method') PaymentMethodEntity? paymentMethod,
            @JsonKey(name: 'updated_at') String? updatedAt,
            List<ProductItemOrderEntity> items)?
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? id,
            String name,
            String? email,
            String? gender,
            String? phone,
            String? birthday,
            @JsonKey(name: 'total_price') int? totalPrice,
            String? notes,
            @JsonKey(name: 'payment_method_id') int? paymentMethodId,
            @JsonKey(name: 'paid_amount') int? paidAmount,
            @JsonKey(name: 'change_amount') int? changeAmount,
            @JsonKey(name: 'payment_method') PaymentMethodEntity? paymentMethod,
            @JsonKey(name: 'updated_at') String? updatedAt,
            List<ProductItemOrderEntity> items)?
        entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderEntity value) entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderEntity value)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderEntity value)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String? email,
      String? gender,
      String? phone,
      String? birthday,
      @JsonKey(name: 'total_price') int? totalPrice,
      String? notes,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'paid_amount') int? paidAmount,
      @JsonKey(name: 'change_amount') int? changeAmount,
      @JsonKey(name: 'payment_method') PaymentMethodEntity? paymentMethod,
      @JsonKey(name: 'updated_at') String? updatedAt,
      List<ProductItemOrderEntity> items});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? email = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
    Object? birthday = freezed,
    Object? totalPrice = freezed,
    Object? notes = freezed,
    Object? paymentMethodId = freezed,
    Object? paidAmount = freezed,
    Object? changeAmount = freezed,
    Object? paymentMethod = freezed,
    Object? updatedAt = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      paidAmount: freezed == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      changeAmount: freezed == changeAmount
          ? _value.changeAmount
          : changeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodEntity?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItemOrderEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderEntityImplCopyWith<$Res>
    implements $OrderCopyWith<$Res> {
  factory _$$OrderEntityImplCopyWith(
          _$OrderEntityImpl value, $Res Function(_$OrderEntityImpl) then) =
      __$$OrderEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String? email,
      String? gender,
      String? phone,
      String? birthday,
      @JsonKey(name: 'total_price') int? totalPrice,
      String? notes,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'paid_amount') int? paidAmount,
      @JsonKey(name: 'change_amount') int? changeAmount,
      @JsonKey(name: 'payment_method') PaymentMethodEntity? paymentMethod,
      @JsonKey(name: 'updated_at') String? updatedAt,
      List<ProductItemOrderEntity> items});
}

/// @nodoc
class __$$OrderEntityImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderEntityImpl>
    implements _$$OrderEntityImplCopyWith<$Res> {
  __$$OrderEntityImplCopyWithImpl(
      _$OrderEntityImpl _value, $Res Function(_$OrderEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? email = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
    Object? birthday = freezed,
    Object? totalPrice = freezed,
    Object? notes = freezed,
    Object? paymentMethodId = freezed,
    Object? paidAmount = freezed,
    Object? changeAmount = freezed,
    Object? paymentMethod = freezed,
    Object? updatedAt = freezed,
    Object? items = null,
  }) {
    return _then(_$OrderEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      paidAmount: freezed == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      changeAmount: freezed == changeAmount
          ? _value.changeAmount
          : changeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodEntity?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItemOrderEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderEntityImpl implements OrderEntity {
  const _$OrderEntityImpl(
      {this.id,
      required this.name,
      this.email,
      this.gender,
      this.phone,
      this.birthday,
      @JsonKey(name: 'total_price') this.totalPrice,
      this.notes,
      @JsonKey(name: 'payment_method_id') this.paymentMethodId,
      @JsonKey(name: 'paid_amount') this.paidAmount,
      @JsonKey(name: 'change_amount') this.changeAmount,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      @JsonKey(name: 'updated_at') this.updatedAt,
      required final List<ProductItemOrderEntity> items})
      : _items = items;

  factory _$OrderEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  final String? phone;
  @override
  final String? birthday;
  @override
  @JsonKey(name: 'total_price')
  final int? totalPrice;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'payment_method_id')
  final int? paymentMethodId;
  @override
  @JsonKey(name: 'paid_amount')
  final int? paidAmount;
  @override
  @JsonKey(name: 'change_amount')
  final int? changeAmount;
  @override
  @JsonKey(name: 'payment_method')
  final PaymentMethodEntity? paymentMethod;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<ProductItemOrderEntity> _items;
  @override
  List<ProductItemOrderEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Order.entity(id: $id, name: $name, email: $email, gender: $gender, phone: $phone, birthday: $birthday, totalPrice: $totalPrice, notes: $notes, paymentMethodId: $paymentMethodId, paidAmount: $paidAmount, changeAmount: $changeAmount, paymentMethod: $paymentMethod, updatedAt: $updatedAt, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.changeAmount, changeAmount) ||
                other.changeAmount == changeAmount) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethod, paymentMethod) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      gender,
      phone,
      birthday,
      totalPrice,
      notes,
      paymentMethodId,
      paidAmount,
      changeAmount,
      const DeepCollectionEquality().hash(paymentMethod),
      updatedAt,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      __$$OrderEntityImplCopyWithImpl<_$OrderEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? id,
            String name,
            String? email,
            String? gender,
            String? phone,
            String? birthday,
            @JsonKey(name: 'total_price') int? totalPrice,
            String? notes,
            @JsonKey(name: 'payment_method_id') int? paymentMethodId,
            @JsonKey(name: 'paid_amount') int? paidAmount,
            @JsonKey(name: 'change_amount') int? changeAmount,
            @JsonKey(name: 'payment_method') PaymentMethodEntity? paymentMethod,
            @JsonKey(name: 'updated_at') String? updatedAt,
            List<ProductItemOrderEntity> items)
        entity,
  }) {
    return entity(
        id,
        name,
        email,
        gender,
        phone,
        birthday,
        totalPrice,
        notes,
        paymentMethodId,
        paidAmount,
        changeAmount,
        paymentMethod,
        updatedAt,
        items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int? id,
            String name,
            String? email,
            String? gender,
            String? phone,
            String? birthday,
            @JsonKey(name: 'total_price') int? totalPrice,
            String? notes,
            @JsonKey(name: 'payment_method_id') int? paymentMethodId,
            @JsonKey(name: 'paid_amount') int? paidAmount,
            @JsonKey(name: 'change_amount') int? changeAmount,
            @JsonKey(name: 'payment_method') PaymentMethodEntity? paymentMethod,
            @JsonKey(name: 'updated_at') String? updatedAt,
            List<ProductItemOrderEntity> items)?
        entity,
  }) {
    return entity?.call(
        id,
        name,
        email,
        gender,
        phone,
        birthday,
        totalPrice,
        notes,
        paymentMethodId,
        paidAmount,
        changeAmount,
        paymentMethod,
        updatedAt,
        items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? id,
            String name,
            String? email,
            String? gender,
            String? phone,
            String? birthday,
            @JsonKey(name: 'total_price') int? totalPrice,
            String? notes,
            @JsonKey(name: 'payment_method_id') int? paymentMethodId,
            @JsonKey(name: 'paid_amount') int? paidAmount,
            @JsonKey(name: 'change_amount') int? changeAmount,
            @JsonKey(name: 'payment_method') PaymentMethodEntity? paymentMethod,
            @JsonKey(name: 'updated_at') String? updatedAt,
            List<ProductItemOrderEntity> items)?
        entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(
          id,
          name,
          email,
          gender,
          phone,
          birthday,
          totalPrice,
          notes,
          paymentMethodId,
          paidAmount,
          changeAmount,
          paymentMethod,
          updatedAt,
          items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderEntity value) entity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderEntity value)? entity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderEntity value)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderEntityImplToJson(
      this,
    );
  }
}

abstract class OrderEntity implements Order {
  const factory OrderEntity(
      {final int? id,
      required final String name,
      final String? email,
      final String? gender,
      final String? phone,
      final String? birthday,
      @JsonKey(name: 'total_price') final int? totalPrice,
      final String? notes,
      @JsonKey(name: 'payment_method_id') final int? paymentMethodId,
      @JsonKey(name: 'paid_amount') final int? paidAmount,
      @JsonKey(name: 'change_amount') final int? changeAmount,
      @JsonKey(name: 'payment_method') final PaymentMethodEntity? paymentMethod,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      required final List<ProductItemOrderEntity> items}) = _$OrderEntityImpl;

  factory OrderEntity.fromJson(Map<String, dynamic> json) =
      _$OrderEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get gender;
  @override
  String? get phone;
  @override
  String? get birthday;
  @override
  @JsonKey(name: 'total_price')
  int? get totalPrice;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'payment_method_id')
  int? get paymentMethodId;
  @override
  @JsonKey(name: 'paid_amount')
  int? get paidAmount;
  @override
  @JsonKey(name: 'change_amount')
  int? get changeAmount;
  @override
  @JsonKey(name: 'payment_method')
  PaymentMethodEntity? get paymentMethod;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  List<ProductItemOrderEntity> get items;
  @override
  @JsonKey(ignore: true)
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
