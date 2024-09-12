part of 'update_product_cubit.dart';

@freezed
class UpdateProductState with _$UpdateProductState {
  const factory UpdateProductState.initial() = _Initial;
  const factory UpdateProductState.loadInProgress() = _LoadInProgress;
  const factory UpdateProductState.loadSuccess(GeneralResponse? response) =
      _LoadSuccess;
  const factory UpdateProductState.loadFailure(Failure? failure) = _LoadFailure;
}
