import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:generic_paging_using_bloc/core/api/api_client.dart';
import 'package:generic_paging_using_bloc/core/network_info/network_info.dart';
import 'package:generic_paging_using_bloc/di/app_module.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

singletonModule() async {
  // SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  // dio
  getIt.registerLazySingleton<Dio>(() => ApiClient.getInstance());

  // InternetConnectionChecker
  getIt.registerLazySingleton(() => InternetConnection());
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplUsingInternetConnectivityPlus(getIt()));
}
