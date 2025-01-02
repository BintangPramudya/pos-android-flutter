import 'package:dewakoding_kasir/core/constant/constant.dart';
import 'package:dewakoding_kasir/core/network/data_state.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'payment_method_api_service.g.dart';

@RestApi()
abstract class PaymentMethodApiService {
  factory PaymentMethodApiService(Dio dio) {
    return _PaymentMethodApiService(dio);
  }

  @GET(PAYMENT_METHOD_URL)
  Future<HttpResponse<DataState>> getAll();
}
