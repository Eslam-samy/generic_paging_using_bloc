import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PagingApiClient {
  static getInstance(String url) {
    final dio = Dio();

    final defaultHeaders = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    dio.options = BaseOptions(
      baseUrl: url,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 60),
      headers: defaultHeaders,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
