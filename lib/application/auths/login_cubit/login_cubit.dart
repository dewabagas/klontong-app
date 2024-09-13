import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _firebaseAuth;

  LoginCubit(this._firebaseAuth) : super(const LoginState.initial());

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      emit(const LoginState.loadInProgress());
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginState.loadSuccess(userCredential.user));
    } catch (e) {
      emit(LoginState.loadFailure(
          ServerFailure(message: e.toString(), errorCode: 400)));
    }
  }
}
