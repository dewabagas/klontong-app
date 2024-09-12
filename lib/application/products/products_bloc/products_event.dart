part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.getProducts() = _GetProducts;
  const factory ProductsEvent.searchProducts(String query) = _SearchProducts;
}
