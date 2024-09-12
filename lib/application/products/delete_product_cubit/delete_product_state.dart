part of 'delete_product_cubit.dart';

@freezed
class DeleteProductState with _$DeleteProductState {
  const factory DeleteProductState.initial() = _Initial;
  const factory DeleteProductState.loadInProgress() = _LoadInProgress;
  const factory DeleteProductState.loadSuccess(GeneralResponse? response) =
      _LoadSuccess;
  const factory DeleteProductState.loadFailure(Failure? failure) = _LoadFailure;
}
