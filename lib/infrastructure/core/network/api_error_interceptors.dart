import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klontong_app/domain/core/constants/preference_constants.dart';
import 'package:klontong_app/domain/core/helpers/preference_helper.dart';
import 'package:klontong_app/presentation/core/app.dart';
import 'package:klontong_app/presentation/core/constants/strings.dart';
import 'package:klontong_app/presentation/core/utils/common_utils.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';

class AppInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('AppInterceptors ${err}');
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        handler.next(DeadlineExceededException(err.requestOptions));
        return;
      case DioExceptionType.badResponse:
        log('responseMessage ${err.response?.data}');
        switch (err.response?.statusCode) {
          case 401:
            log('responseMessages data aja ${err.response?.toString().contains('Unauthenticated') == true}');
            log('responseMessages mesage ${err.response?.data['message'].toString().contains('Unauthenticated') == true}');
            if (err.response?.data.toString().contains('Unauthenticated') ==
                true) {
              clearUserCredentials('${err.response?.data['message']}');
              handler.next(TokenExpiredException(err.requestOptions));
            } else {
              handler.next(UnknownErrorException(err.requestOptions,
                  message: formatErrorMessage(
                      err.response?.data.toString() ?? 'An error occured')));
            }
            return;
          case 500:
            handler.next(InternalServerErrorException(err.requestOptions));
            return;
          default:
            handler.next(UnknownErrorException(
              err.requestOptions,
              message: formatErrorMessage(
                  err.response?.data.toString() ?? 'An error occurred'),
            ));
            return;
        }
      case DioExceptionType.badCertificate:
        handler.next(BadCertificateException(err.requestOptions));
        return;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        handler.next(NoInternetConnectionException(err.requestOptions));
        return;
      default:
        handler.next(UnknownErrorException(err.requestOptions));
        return;
    }

    handler.next(err); // Proceed with the error if it's not handled
  }
}

class BadCertificateException extends DioError {
  BadCertificateException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Bad certificate detected';
  }
}

class UnknownErrorException extends DioError {
  final String message;
  UnknownErrorException(RequestOptions r,
      {this.message = 'An unknown error occurred'})
      : super(requestOptions: r);

  @override
  String toString() {
    return message;
  }
}

void clearUserCredentials(String message) async {
  Fluttertoast.showToast(msg: AppStrings.tokenExpired);
  await removeAllValuesPreference();
  // await removeValuesPreference(key: PreferenceConstants.accessToken);
  await addBoolToPreference(key: PreferenceConstants.isLoggedIn, value: false);
  appRouter.router.pushReplacement(RoutePaths.dashboard);
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class TokenExpiredException extends DioError {
  TokenExpiredException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Token has expired';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
