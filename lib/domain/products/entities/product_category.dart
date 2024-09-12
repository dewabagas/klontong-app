import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.freezed.dart';

@freezed
class ProductCategory with _$ProductCategory {
  factory ProductCategory({
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
  }) = _ProductCategory;
}
