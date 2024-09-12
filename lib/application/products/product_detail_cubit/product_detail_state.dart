part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = _Initial;
  const factory ProductDetailState.loadInProgress() = _LoadInProgress;
  const factory ProductDetailState.loadSuccess(Product? response) =
      _LoadSuccess;
  const factory ProductDetailState.loadFailure(Failure? failure) = _LoadFailure;
}
