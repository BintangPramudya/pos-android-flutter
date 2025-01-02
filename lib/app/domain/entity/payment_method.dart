import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.g.dart';
part 'payment_method.freezed.dart';

@freezed
sealed class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod.entity({
    required int id,
    required String name,
  }) = PaymentMethodEntity;
  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}
