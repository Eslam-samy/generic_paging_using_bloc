import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:generic_paging_using_bloc/core/constants/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static getInstance() {
    final dio = Dio();

    final defaultHeaders = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    dio.options = BaseOptions(
      baseUrl: baseUrl,
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
