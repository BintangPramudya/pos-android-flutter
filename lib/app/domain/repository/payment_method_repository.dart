import 'package:bintang_kasir/app/domain/entity/payment_method.dart';
import 'package:bintang_kasir/core/network/data_state.dart';

abstract class PaymentMethodRepository {
  Future<DataState<List<PaymentMethodEntity>>> getAll();
}
