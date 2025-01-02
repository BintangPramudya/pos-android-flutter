import 'package:dewakoding_kasir/app/domain/entity/order.dart';
import 'package:dewakoding_kasir/app/domain/repository/order_repository.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';
import 'package:dewakoding_kasir/core/use_case/app_use_case.dart';

class OrderSendUseCase extends AppUseCase<Future<DataState<int>>, OrderEntity> {
  final OrderRepository _orderRepository;

  OrderSendUseCase(this._orderRepository);

  @override
  Future<DataState<int>> call({OrderEntity? param}) {
    return _orderRepository.insert(param!);
  }
}
