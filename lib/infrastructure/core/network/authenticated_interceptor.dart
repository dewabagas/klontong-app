import 'dart:io';

import 'package:dio/dio.dart';
import 'package:klontong_app/domain/core/constants/preference_constants.dart';
import 'package:klontong_app/domain/core/helpers/preference_helper.dart';
import 'package:logger/logger.dart';

class AuthenticatedInterceptor extends Interceptor {
  final Logger _logger;

  AuthenticatedInterceptor(this._logger);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken =
        await getStringValuesPreference(key: PreferenceConstants.accessToken);
    if (accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _logger.e(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
