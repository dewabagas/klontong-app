import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int? errorCode;
  final String? message;

  const Failure({this.errorCode, this.message});

  @override
  List<Object?> get props => [errorCode, message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.errorCode, super.message});

  @override
  List<Object?> get props => [errorCode, message];
}

class CacheFailure extends Failure {}

class NullFailure extends Failure {}

class UnknownFailure extends Failure {}

class PermissionFailure extends Failure {
  const PermissionFailure({super.message});

  @override
  List<Object?> get props => [message];
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message});

  @override
  List<Object?> get props => [message];
}

class UnauthorizedPaymentFailure extends Failure {
  const UnauthorizedPaymentFailure({super.message});

  @override
  List<Object?> get props => [message];
}

class GeneralException implements Exception {
  final String message;

  GeneralException({required this.message});
}

class GeneralFailure extends Failure {
  final String message;

  const GeneralFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
