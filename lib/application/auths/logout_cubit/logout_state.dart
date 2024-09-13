part of 'logout_cubit.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = _Initial;
  const factory LogoutState.loadInProgress() = _Loading;
  const factory LogoutState.loadSuccess(GeneralResponse? response) = _Success;
  const factory LogoutState.loadFailure(Failure? failure) = _Failure;
}
