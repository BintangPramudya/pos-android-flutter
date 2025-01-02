import 'package:dewakoding_kasir/app/domain/entity/payment_method.dart';
import 'package:dewakoding_kasir/app/domain/entity/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.g.dart';
part 'order.freezed.dart';

@freezed
sealed class Order with _$Order {
  const factory Order.entity(
      {int? id,
      required String name,
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
      required List<ProductItemOrderEntity> items}) = OrderEntity;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
