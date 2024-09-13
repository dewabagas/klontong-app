import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';
import 'package:klontong_app/domain/core/entities/general_response.dart';

part 'logout_state.dart';
part 'logout_cubit.freezed.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  final FirebaseAuth _firebaseAuth;

  LogoutCubit(this._firebaseAuth) : super(const LogoutState.initial());

  Future<void> logout() async {
    try {
      emit(const LogoutState.loadInProgress());
      await _firebaseAuth.signOut();
      emit(LogoutState.loadSuccess(GeneralResponse(message: 'Logout Success')));
    } catch (e) {
      emit(LogoutState.loadFailure(
          ServerFailure(message: e.toString(), errorCode: 400)));
    }
  }
}
