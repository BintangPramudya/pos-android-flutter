import 'dart:io';

import 'package:dewakoding_kasir/core/constant/constant.dart';
import 'package:dewakoding_kasir/core/helper/shared_preferences_helper.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = await SharedPreferencesHelper.getString(PREF_BASE_URL);
    options.headers['accept'] = 'application/json';
    final String? authToken =
        await SharedPreferencesHelper.getString(PREF_AUTH);
    if (authToken != null) options.headers['Authorization'] = authToken;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != HttpStatus.ok) {
      return handler.resolve(Response(
          requestOptions: response.requestOptions, data: response.data));
    }
    super.onResponse(response, handler);
  }
}
