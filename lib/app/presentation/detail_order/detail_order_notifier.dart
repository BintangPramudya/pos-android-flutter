import 'package:bintang_kasir/app/domain/entity/order.dart';
import 'package:bintang_kasir/app/domain/usecase/order_get_by_id.dart';
import 'package:bintang_kasir/core/provider/app_provider.dart';

class DetailOrderNotifier extends AppProvider {
  final int _id;
  final OrderGetByIdUseCase _orderGetByIdUseCase;

  DetailOrderNotifier(this._id, this._orderGetByIdUseCase) {
    init();
  }

  OrderEntity? _order;

  OrderEntity? get order => _order;

  @override
  init() async {
    await _getOrder();
  }

  _getOrder() async {
    showLoading();

    final response = await _orderGetByIdUseCase(param: _id);
    if (response.success) {
      _order = response.data!;
    } else {
      errorMessage = response.message;
    }

    hideLoading();
  }
}
