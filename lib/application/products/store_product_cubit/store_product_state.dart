part of 'store_product_cubit.dart';

@freezed
class StoreProductState with _$StoreProductState {
  const factory StoreProductState.initial() = _Initial;
  const factory StoreProductState.loadInProgress() = _LoadInProgress;
  const factory StoreProductState.loadSuccess(GeneralResponse? response) =
      _LoadSuccess;
  const factory StoreProductState.loadFailure(Failure? failure) = _LoadFailure;
}
