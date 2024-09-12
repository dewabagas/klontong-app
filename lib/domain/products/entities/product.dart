import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  factory Product({
    String? id,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    String? sku,
    String? name,
    String? description,
    double? weight,
    String? image,
    double? price,
    int? stock,
    String? unit,
    @JsonKey(name: 'supplier_name') String? supplierName,
  }) = _Product;
}
