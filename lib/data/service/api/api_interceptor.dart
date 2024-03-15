import 'dart:developer';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Do something before a request is sent
    log('Request to ${options.baseUrl}${options.path}');
    log('Request data: ${options.data}');
    // Continue with the request
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data
    log('Response from ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    log('Response data: ${response.data}');
    // Continue with the response
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Do something with response error
    log('Error: $err');
    // Continue with the error
    super.onError(err, handler);
  }
}
