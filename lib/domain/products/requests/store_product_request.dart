import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_product_request.freezed.dart';
part 'store_product_request.g.dart';

@freezed
class StoreProductRequest with _$StoreProductRequest {
  factory StoreProductRequest({
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
  }) = _StoreProductRequest;

  factory StoreProductRequest.fromJson(Map<String, dynamic> json) =>
      _$StoreProductRequestFromJson(json);
}
