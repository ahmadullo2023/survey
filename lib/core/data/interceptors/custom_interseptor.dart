// import 'package:dio/dio.dart';
//
// import '../../singletons/service_locator.dart';
// import '../../singletons/storage/storage.dart';
// import '../../singletons/streams/streems.dart';
//
// class CustomInterceptor implements Interceptor {
//   final Dio dio;
//   static bool isRequestNotAllowed = false;
//   static bool isRefreshAllowed = true;
//
//   const CustomInterceptor({required this.dio});
//
//   @override
//   Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode != null && err.response!.statusCode! >= 500) {
//       serviceLocator<ServerErrorStream>().sink.add(true);
//     }
//     if (err.type == DioExceptionType.badResponse &&
//         (err.response?.statusCode == 403 || err.response?.statusCode == 401)) {
//       if (StorageRepository.getString(StoreKeys.refresh).isEmpty) {
//         serviceLocator<IsAuthenticatedStream>().sink.add(false);
//
//         handler.next(err);
//         return;
//       }
//
//       if (isRefreshAllowed) {
//         await _refreshToken();
//       } else {
//         serviceLocator<IsAuthenticatedStream>().sink.add(false);
//       }
//
//       if (StorageRepository.getString(StoreKeys.token).replaceAll('Bearer', '').trim().isNotEmpty) {
//         err.requestOptions.headers['Authorization'] = StorageRepository.getString(StoreKeys.token);
//       } else {
//         serviceLocator<IsAuthenticatedStream>().sink.add(false);
//       }
//
//       if (isRequestNotAllowed) {
//         isRequestNotAllowed = false;
//         isRefreshAllowed = true;
//         handler.next(err);
//         return;
//       }
//
//       final response = await _resolveResponse(err.requestOptions);
//       if (response.statusCode! >= 200 && response.statusCode! < 300) {
//         isRequestNotAllowed = false;
//         isRefreshAllowed = true;
//       }
//       handler.resolve(response);
//       return;
//     }
//     handler.next(err);
//   }
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers['Accept-Language'] = serviceLocator<LanguageUtil>().language;
//     handler.next(options);
//   }
//
//   @override
//   Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
//     if (response.statusCode != null && response.statusCode! >= 500) {
//       serviceLocator<ServerErrorStream>().sink.add(true);
//     }
//
//     if (response.statusCode == 403 || response.statusCode == 401) {
//       if (StorageRepository.getString(StoreKeys.refresh).isEmpty) {
//         serviceLocator<IsAuthenticatedStream>().sink.add(false);
//
//         handler.next(response);
//         return;
//       }
//
//       if (isRefreshAllowed) {
//         await _refreshToken();
//       } else {
//         serviceLocator<IsAuthenticatedStream>().sink.add(false);
//       }
//
//       if (StorageRepository.getString(StoreKeys.token).replaceAll('Bearer', '').trim().isNotEmpty) {
//         response.requestOptions.headers['Authorization'] = StorageRepository.getString(StoreKeys.token);
//       } else {
//         serviceLocator<IsAuthenticatedStream>().sink.add(false);
//       }
//
//       if (isRequestNotAllowed) {
//         isRequestNotAllowed = false;
//         isRefreshAllowed = true;
//         handler.next(response);
//         return;
//       } else {
//         final resolved = await _resolveResponse(response.requestOptions);
//
//         if (resolved.statusCode! >= 200 && resolved.statusCode! < 300) {
//           isRequestNotAllowed = false;
//           isRefreshAllowed = true;
//         }
//         handler.next(response);
//         return;
//       }
//     } else if (response.statusCode == 301) {
//       if (isRequestNotAllowed) {
//         isRequestNotAllowed = false;
//         handler.next(response);
//         return;
//       }
//
//       /// Redirecting to new url
//       String newLocation = response.headers.value('location') ?? '';
//       final resolved = await _resolveResponse(response.requestOptions.copyWith(path: newLocation));
//       if (resolved.statusCode! >= 200 && resolved.statusCode! < 300) {
//         isRequestNotAllowed = false;
//       }
//       handler.resolve(resolved);
//       return;
//     }
//
//     handler.next(response);
//   }
//
//   // Future<void> _refreshToken() async {
//   //   isRefreshAllowed = false;
//   //   if (StorageRepository.getString(StoreKeys.refresh).isNotEmpty) {
//   //     try {
//   //       var refreshToken = StorageRepository.getString(StoreKeys.refresh);
//   //       final response = await dio.post(
//   //         '${AppConstants.BASE_URL_PROD_ID}/TokenRefresh/',
//   //         data: {"refresh": refreshToken},
//   //       );
//   //       if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
//   //         StorageRepository.putString(StoreKeys.token, 'Bearer ${response.data['access']}');
//   //         StorageRepository.putString(StoreKeys.refresh, "${response.data['refresh']}");
//   //
//   //         serviceLocator<IsAuthenticatedStream>().sink.add(true);
//   //       } else {
//   //         serviceLocator<IsAuthenticatedStream>().sink.add(false);
//   //       }
//   //     } catch (e) {
//   //       print('Error refreshing token: $e');
//   //       serviceLocator<IsAuthenticatedStream>().sink.add(false);
//   //     }
//   //   }
//   // }
//
//   Future<Response<dynamic>> _resolveResponse(RequestOptions options) async {
//     isRequestNotAllowed = true;
//     if (options.data is FormData) {
//       FormData formData = FormData();
//       final fields = options.data.fields as List<MapEntry<String, String>>;
//       formData.fields.addAll(fields);
//
//       for (MapEntry mapFile in options.data.files) {
//         formData.files.add(MapEntry(
//             mapFile.key,
//             MultipartFile.fromFileSync(
//                 fields.firstWhere((element) => element.key == 'photo_path', orElse: () => const MapEntry('', '')).value,
//                 filename: mapFile.value.filename)));
//       }
//       options.data = formData;
//     }
//     return await dio.request(options.path,
//         data: options.data,
//         queryParameters: options.queryParameters,
//         options: Options(headers: options.headers, method: options.method));
//   }
// }
