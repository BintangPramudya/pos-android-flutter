import 'package:bintang_kasir/app/domain/entity/order.dart';
import 'package:bintang_kasir/app/domain/repository/order_repository.dart';
import 'package:bintang_kasir/core/network/data_state.dart';
import 'package:bintang_kasir/core/use_case/app_use_case.dart';

class OrderGetAllUseCase
    extends AppUseCase<Future<DataState<List<OrderEntity>>>, void> {
  final OrderRepository _orderRepository;

  OrderGetAllUseCase(this._orderRepository);

  @override
  Future<DataState<List<OrderEntity>>> call({void param}) {
    return _orderRepository.getAll();
  }
}
