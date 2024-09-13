import 'package:dartz/dartz.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';

abstract class IAuthRepository {
  Future<Either<Failure, Unit>> register({
    required String email,
    required String password,
  });
}
