import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import '../../app.dart';
import '../constants/constants.dart';
import 'app_path_provider.dart';

typedef ConverterFunctionType<T> = T Function(dynamic response);

class DioSettings {
  BaseOptions _dioBaseOptions({required String? baseUrl}) => BaseOptions(
      baseUrl: baseUrl ?? Constants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500);

  Dio dio({String? baseUrl}) {
    final dio = Dio(_dioBaseOptions(baseUrl: baseUrl));
    dio.interceptors
      ..add(chuck.getDioInterceptor())
      ..add(DioCacheInterceptor(
          options: CacheOptions(
              store: HiveCacheStore(AppPathProvider.path),
              policy: CachePolicy.refreshForceCache,
              hitCacheOnErrorExcept: [],
              maxStale: const Duration(days: 1),
              priority: CachePriority.high,
              allowPostMethod: false)))
      ..add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: true,
          requestHeader: true,
          logPrint: (object) => log(object.toString())));
    return dio;
  }

}
