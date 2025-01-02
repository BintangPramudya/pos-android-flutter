import 'package:dewakoding_kasir/app/domain/entity/order.dart';
import 'package:dewakoding_kasir/app/domain/repository/order_repository.dart';
import 'package:dewakoding_kasir/core/helper/date_time_helper.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';
import 'package:dewakoding_kasir/core/use_case/app_use_case.dart';

class OrderGetTodayUseCase
    extends AppUseCase<Future<DataState<List<OrderEntity>>>, void> {
  final OrderRepository _orderRepository;

  OrderGetTodayUseCase(this._orderRepository);
  @override
  Future<DataState<List<OrderEntity>>> call({void param}) async {
    final response = await _orderRepository.getAll();
    if (response.success) {
      final now = DateTime.now();
      final listFiltered = response.data!
          .where((element) =>
              DateTimeHelper.formatDateTimeFromString(
                  dateTimeString: element.updatedAt!) ==
              DateTimeHelper.formatDateTime(dateTime: now))
          .toList();
      return SuccessState(message: response.message, data: listFiltered);
    } else {
      return response;
    }
  }
}
