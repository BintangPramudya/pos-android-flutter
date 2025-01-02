import 'package:dewakoding_kasir/app/domain/entity/order.dart';
import 'package:dewakoding_kasir/app/domain/repository/order_repository.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';
import 'package:dewakoding_kasir/core/use_case/app_use_case.dart';

class OrderGetByIdUseCase
    extends AppUseCase<Future<DataState<OrderEntity>>, int> {
  final OrderRepository _orderRepository;

  OrderGetByIdUseCase(this._orderRepository);

  @override
  Future<DataState<OrderEntity>> call({int? param}) {
    return _orderRepository.getById(param!);
  }
}
