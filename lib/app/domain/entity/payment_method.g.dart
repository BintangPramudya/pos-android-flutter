// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodEntityImpl _$$PaymentMethodEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodEntityImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$PaymentMethodEntityImplToJson(
        _$PaymentMethodEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
