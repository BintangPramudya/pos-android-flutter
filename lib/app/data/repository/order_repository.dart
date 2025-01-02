import 'package:dewakoding_kasir/app/data/source/order_api_service.dart';
import 'package:dewakoding_kasir/app/domain/entity/order.dart';
import 'package:dewakoding_kasir/app/domain/repository/order_repository.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderApiService _orderApiService;

  OrderRepositoryImpl(this._orderApiService);

  @override
  Future<DataState<List<OrderEntity>>> getAll() {
    return handleResponse(
        () => _orderApiService.getAll(),
        (json) => List<OrderEntity>.from(
            json.map((item) => OrderEntity.fromJson(item))));
  }

  @override
  Future<DataState<OrderEntity>> getById(int id) {
    return handleResponse(() => _orderApiService.getById(id: id),
        (json) => OrderEntity.fromJson(json));
  }

  @override
  Future<DataState<int>> insert(OrderEntity param) {
    return handleResponse(() => _orderApiService.insert(body: param.toJson()),
        (json) => json['id']);
  }

  @override
  Future<DataState> update(OrderEntity param) {
    return handleResponse(
        () => _orderApiService.update(id: param.id!, body: param.toJson()),
        (json) => null);
  }
}
