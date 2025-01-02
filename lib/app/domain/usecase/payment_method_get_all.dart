import 'package:dewakoding_kasir/app/domain/entity/payment_method.dart';
import 'package:dewakoding_kasir/app/domain/repository/payment_method_repository.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';
import 'package:dewakoding_kasir/core/use_case/app_use_case.dart';

class PaymentMethodGetAllUseCase
    extends AppUseCase<Future<DataState<List<PaymentMethodEntity>>>, void> {
  final PaymentMethodRepository _paymentMethodRepository;

  PaymentMethodGetAllUseCase(this._paymentMethodRepository);
  @override
  Future<DataState<List<PaymentMethodEntity>>> call({void param}) {
    return _paymentMethodRepository.getAll();
  }
}
