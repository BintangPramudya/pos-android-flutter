// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductEntityImpl _$$ProductEntityImplFromJson(Map<String, dynamic> json) =>
    _$ProductEntityImpl(
      id: (json['id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      name: json['name'] as String,
      stock: (json['stock'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      isActive: json['is_active'] as bool,
      imageUrl: json['image_url'] as String?,
      barcode: json['barcode'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ProductEntityImplToJson(_$ProductEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'stock': instance.stock,
      'price': instance.price,
      'is_active': instance.isActive,
      'image_url': instance.imageUrl,
      'barcode': instance.barcode,
      'runtimeType': instance.$type,
    };

_$ProductItemOrderEntityImpl _$$ProductItemOrderEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductItemOrderEntityImpl(
      id: (json['product_id'] as num).toInt(),
      name: json['product_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['unit_price'] as num).toInt(),
      barcode: json['barcode'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ProductItemOrderEntityImplToJson(
        _$ProductItemOrderEntityImpl instance) =>
    <String, dynamic>{
      'product_id': instance.id,
      'product_name': instance.name,
      'quantity': instance.quantity,
      'unit_price': instance.price,
      'barcode': instance.barcode,
      'stock': instance.stock,
      'runtimeType': instance.$type,
    };
