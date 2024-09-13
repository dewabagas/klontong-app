part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loadInProgress() = _Loading;
  const factory LoginState.loadSuccess(User? user) = _Success;
  const factory LoginState.loadFailure(Failure failure) = _Failure;
}
