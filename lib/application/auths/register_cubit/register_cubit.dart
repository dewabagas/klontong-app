import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuth _firebaseAuth;

  RegisterCubit(this._firebaseAuth) : super(const RegisterState.initial());

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(const RegisterState.loadInProgress());

      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(const RegisterState.loadSuccess());
    } catch (e) {
      emit(RegisterState.loadFailure(
          ServerFailure(message: e.toString(), errorCode: 400)));
    }
  }
}
