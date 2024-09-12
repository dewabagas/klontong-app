import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:klontong_app/domain/products/entities/product.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDto with _$ProductDto {
  const ProductDto._();
  factory ProductDto({
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
  }) = _ProductDto;

  factory ProductDto.fromDomain(Product product) {
    return ProductDto(
      id: product.id,
      categoryId: product.categoryId,
      categoryName: product.categoryName,
      sku: product.sku,
      name: product.name,
      description: product.description,
      weight: product.weight,
      image: product.image,
      price: product.price,
      stock: product.stock,
      unit: product.unit,
      supplierName: product.supplierName,
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      categoryId: categoryId,
      categoryName: categoryName,
      sku: sku,
      name: name,
      description: description,
      weight: weight,
      image: image,
      price: price,
      stock: stock,
      unit: unit,
      supplierName: supplierName,
    );
  }

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  static List<Product> fromJsonList(List<dynamic> list) {
    return list.map((dynamic json) {
      return ProductDto.fromJson(json as Map<String, dynamic>).toDomain();
    }).toList();
  }
}
