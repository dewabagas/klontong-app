class ServerException implements Exception {
  final int? errorCode;
  final String? message;

  ServerException({this.errorCode, this.message});
}

class PermissionException implements Exception {
  final int? errorCode;
  final String? message;

  PermissionException({this.errorCode, this.message});
}

class CacheException implements Exception {}

class UnauthorizedException implements Exception {
  final String? message;

  UnauthorizedException({this.message});
}

class UnauthorizedPaymentException implements Exception {
  final String? message;

  UnauthorizedPaymentException({this.message});
}
