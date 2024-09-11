import 'package:dio/dio.dart';
import 'package:klontong_app/domain/core/constants/api_constants.dart';
import 'package:klontong_app/infrastructure/core/network/api_error_interceptors.dart';
import 'package:klontong_app/infrastructure/core/network/authenticated_interceptor.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  static final BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(minutes: 60),
    receiveTimeout: const Duration(minutes: 60),
    contentType: Headers.jsonContentType,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  );

  Dio dioUnauthorizedClient = Dio(options)
    ..interceptors
        .addAll([LogInterceptor(), AppInterceptors(), PrettyDioLogger()]);

  Dio dioAuthorizedClient = Dio(options)
    ..interceptors.addAll([
      LogInterceptor(),
      AppInterceptors(),
      PrettyDioLogger(),
      AuthenticatedInterceptor(Logger())
    ]);

  final interceptor = InterceptorsWrapper(
    onRequest: (options, handler) {
      const String userToken = "SharedPreferencesService.userToken";
      options.headers.addAll({
        "Authorization": "Bearer $userToken",
      });

      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    },
    onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    },
    onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    },
  );
}
