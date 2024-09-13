import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:klontong_app/domain/auths/interfaces/i_auth_repository.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  @override
  Future<Either<Failure, Unit>> register({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(GeneralFailure(message: e.message ?? "Unknown error"));
    }
  }
}
