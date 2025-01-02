// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'entity':
      return ProductEntity.fromJson(json);
    case 'itemOrderEntity':
      return ProductItemOrderEntity.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Product',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            @JsonKey(name: 'category_id') int categoryId,
            String name,
            int stock,
            int price,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? barcode)
        entity,
    required TResult Function(
            @JsonKey(name: 'product_id') int id,
            @JsonKey(name: 'product_name') String name,
            int quantity,
            @JsonKey(name: 'unit_price') int price,
            String? barcode,
            int? stock)
        itemOrderEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            @JsonKey(name: 'category_id') int categoryId,
            String name,
            int stock,
            int price,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? barcode)?
        entity,
    TResult? Function(
            @JsonKey(name: 'product_id') int id,
            @JsonKey(name: 'product_name') String name,
            int quantity,
            @JsonKey(name: 'unit_price') int price,
            String? barcode,
            int? stock)?
        itemOrderEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            @JsonKey(name: 'category_id') int categoryId,
            String name,
            int stock,
            int price,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? barcode)?
        entity,
    TResult Function(
            @JsonKey(name: 'product_id') int id,
            @JsonKey(name: 'product_name') String name,
            int quantity,
            @JsonKey(name: 'unit_price') int price,
            String? barcode,
            int? stock)?
        itemOrderEntity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductEntity value) entity,
    required TResult Function(ProductItemOrderEntity value) itemOrderEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductEntity value)? entity,
    TResult? Function(ProductItemOrderEntity value)? itemOrderEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductEntity value)? entity,
    TResult Function(ProductItemOrderEntity value)? itemOrderEntity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({int id, String name, int stock, int price, String? barcode});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? stock = null,
    Object? price = null,
    Object? barcode = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock!
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductEntityImplCopyWith<$Res>
    implements $ProductCopyWith<$Res> {
  factory _$$ProductEntityImplCopyWith(
          _$ProductEntityImpl value, $Res Function(_$ProductEntityImpl) then) =
      __$$ProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'category_id') int categoryId,
      String name,
      int stock,
      int price,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? barcode});
}

/// @nodoc
class __$$ProductEntityImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductEntityImpl>
    implements _$$ProductEntityImplCopyWith<$Res> {
  __$$ProductEntityImplCopyWithImpl(
      _$ProductEntityImpl _value, $Res Function(_$ProductEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? name = null,
    Object? stock = null,
    Object? price = null,
    Object? isActive = null,
    Object? imageUrl = freezed,
    Object? barcode = freezed,
  }) {
    return _then(_$ProductEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductEntityImpl implements ProductEntity {
  const _$ProductEntityImpl(
      {required this.id,
      @JsonKey(name: 'category_id') required this.categoryId,
      required this.name,
      required this.stock,
      required this.price,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'image_url') this.imageUrl,
      this.barcode,
      final String? $type})
      : $type = $type ?? 'entity';

  factory _$ProductEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductEntityImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  final String name;
  @override
  final int stock;
  @override
  final int price;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final String? barcode;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Product.entity(id: $id, categoryId: $categoryId, name: $name, stock: $stock, price: $price, isActive: $isActive, imageUrl: $imageUrl, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, name, stock,
      price, isActive, imageUrl, barcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      __$$ProductEntityImplCopyWithImpl<_$ProductEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            @JsonKey(name: 'category_id') int categoryId,
            String name,
            int stock,
            int price,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? barcode)
        entity,
    required TResult Function(
            @JsonKey(name: 'product_id') int id,
            @JsonKey(name: 'product_name') String name,
            int quantity,
            @JsonKey(name: 'unit_price') int price,
            String? barcode,
            int? stock)
        itemOrderEntity,
  }) {
    return entity(
        id, categoryId, name, stock, price, isActive, imageUrl, barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            @JsonKey(name: 'category_id') int categoryId,
            String name,
            int stock,
            int price,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? barcode)?
        entity,
    TResult? Function(
            @JsonKey(name: 'product_id') int id,
            @JsonKey(name: 'product_name') String name,
            int quantity,
            @JsonKey(name: 'unit_price') int price,
            String? barcode,
            int? stock)?
        itemOrderEntity,
  }) {
    return entity?.call(
        id, categoryId, name, stock, price, isActive, imageUrl, barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            @JsonKey(name: 'category_id') int categoryId,
            String name,
            int stock,
            int price,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? barcode)?
        entity,
    TResult Function(
            @JsonKey(name: 'product_id') int id,
            @JsonKey(name: 'product_name') String name,
            int quantity,
            @JsonKey(name: 'unit_price') int price,
            String? barcode,
            int? stock)?
        itemOrderEntity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(
          id, categoryId, name, stock, price, isActive, imageUrl, barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductEntity value) entity,
    required TResult Function(ProductItemOrderEntity value) itemOrderEntity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductEntity value)? entity,
    TResult? Function(ProductItemOrderEntity value)? itemOrderEntity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductEntity value)? entity,
    TResult Function(ProductItemOrderEntity value)? itemOrderEntity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductEntityImplToJson(
      this,
    );
  }
}

abstract class ProductEntity implements Product {
  const factory ProductEntity(
      {required final int id,
      @JsonKey(name: 'category_id') required final int categoryId,
      required final String name,
      required final int stock,
      required final int price,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'image_url') final String? imageUrl,
      final String? barcode}) = _$ProductEntityImpl;

  factory ProductEntity.fromJson(Map<String, dynamic> json) =
      _$ProductEntityImpl.fromJson;

  @override
  int get id;
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  String get name;
  @override
  int get stock;
  @override
  int get price;
  @JsonKey(name: 'is_active')
  bool get isActive;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  String? get barcode;
  @override
  @JsonKey(ignore: true)
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductItemOrderEntityImplCopyWith<$Res>
    implements $ProductCopyWith<$Res> {
  factory _$$ProductItemOrderEntityImplCopyWith(
          _$ProductItemOrderEntityImpl value,
          $Res Function(_$ProductItemOrderEntityImpl) then) =
      __$$ProductItemOrderEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int id,
      @JsonKey(name: 'product_name') String name,
      int quantity,
      @JsonKey(name: 'unit_price') int price,
      String? barcode,
      int? stock});
}

/// @nodoc
class __$$ProductItemOrderEntityImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductItemOrderEntityImpl>
    implements _$$ProductItemOrderEntityImplCopyWith<$Res> {
  __$$ProductItemOrderEntityImplCopyWithImpl(
      _$ProductItemOrderEntityImpl _value,
      $Res Function(_$ProductItemOrderEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? price = null,
    Object? barcode = freezed,
    Object? stock = freezed,
  }) {
    return _then(_$ProductItemOrderEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductItemOrderEntityImpl implements ProductItemOrderEntity {
  const _$ProductItemOrderEntityImpl(
      {@JsonKey(name: 'product_id') required this.id,
      @JsonKey(name: 'product_name') required this.name,
      required this.quantity,
      @JsonKey(name: 'unit_price') required this.price,
      this.barcode,
      this.stock,
      final String? $type})
      : $type = $type ?? 'itemOrderEntity';

  factory _$ProductItemOrderEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductItemOrderEntityImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final int id;
  @override
  @JsonKey(name: 'product_name')
  final String name;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit_price')
  final int price;
  @override
  final String? barcode;
  @override
  final int? stock;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Product.itemOrderEntity(id: $id, name: $name, quantity: $quantity, price: $price, barcode: $barcode, stock: $stock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductItemOrderEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.stock, stock) || other.stock == stock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, quantity, price, barcode, stock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductItemOrderEntityImplCopyWith<_$ProductItemOrderEntityImpl>
      get copyWith => __$$ProductItemOrderEntityImplCopyWithImpl<
          _$ProductItemOrderEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            @JsonKey(name: 'category_id') int categoryId,
            String name,
            int stock,
            int price,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? barcode)
        entity,
    required TResult Function(
            @JsonKey(name: 'product_id') int id,
            @JsonKey(name: 'product_name') String name,
            int quantity,
            @JsonKey(name: 'unit_price') int price,
            String? barcode,
            int? stock)
        itemOrderEntity,
  }) {
    return itemOrderEntity(id, name, quantity, price, barcode, stock);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            @JsonKey(name: 'category_id') int categoryId,
            String name,
            int stock,
            int price,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? barcode)?
        entity,
    TResult? Function(
            @JsonKey(name: 'product_id') int id,
            @JsonKey(name: 'product_name') String name,
            int quantity,
            @JsonKey(name: 'unit_price') int price,
            String? barcode,
            int? stock)?
        itemOrderEntity,
  }) {
    return itemOrderEntity?.call(id, name, quantity, price, barcode, stock);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            @JsonKey(name: 'category_id') int categoryId,
            String name,
            int stock,
            int price,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? barcode)?
        entity,
    TResult Function(
            @JsonKey(name: 'product_id') int id,
            @JsonKey(name: 'product_name') String name,
            int quantity,
            @JsonKey(name: 'unit_price') int price,
            String? barcode,
            int? stock)?
        itemOrderEntity,
    required TResult orElse(),
  }) {
    if (itemOrderEntity != null) {
      return itemOrderEntity(id, name, quantity, price, barcode, stock);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductEntity value) entity,
    required TResult Function(ProductItemOrderEntity value) itemOrderEntity,
  }) {
    return itemOrderEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductEntity value)? entity,
    TResult? Function(ProductItemOrderEntity value)? itemOrderEntity,
  }) {
    return itemOrderEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductEntity value)? entity,
    TResult Function(ProductItemOrderEntity value)? itemOrderEntity,
    required TResult orElse(),
  }) {
    if (itemOrderEntity != null) {
      return itemOrderEntity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductItemOrderEntityImplToJson(
      this,
    );
  }
}

abstract class ProductItemOrderEntity implements Product {
  const factory ProductItemOrderEntity(
      {@JsonKey(name: 'product_id') required final int id,
      @JsonKey(name: 'product_name') required final String name,
      required final int quantity,
      @JsonKey(name: 'unit_price') required final int price,
      final String? barcode,
      final int? stock}) = _$ProductItemOrderEntityImpl;

  factory ProductItemOrderEntity.fromJson(Map<String, dynamic> json) =
      _$ProductItemOrderEntityImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  int get id;
  @override
  @JsonKey(name: 'product_name')
  String get name;
  int get quantity;
  @override
  @JsonKey(name: 'unit_price')
  int get price;
  @override
  String? get barcode;
  @override
  int? get stock;
  @override
  @JsonKey(ignore: true)
  _$$ProductItemOrderEntityImplCopyWith<_$ProductItemOrderEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
