part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loadInProgress() = _LoadInProgress;
  const factory ProductsState.loadSuccess(
      {required List<Product>? products,
      required List<Product>? filteredList,
      required String searchQuery}) = _LoadSuccess;
  const factory ProductsState.loadFailure(Failure? failure) = _LoadFailure;
}
