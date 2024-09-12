// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDtoImpl _$$ProductDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductDtoImpl(
      id: json['id'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt(),
      unit: json['unit'] as String?,
      supplierName: json['supplier_name'] as String?,
    );

Map<String, dynamic> _$$ProductDtoImplToJson(_$ProductDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'sku': instance.sku,
      'name': instance.name,
      'description': instance.description,
      'weight': instance.weight,
      'image': instance.image,
      'price': instance.price,
      'stock': instance.stock,
      'unit': instance.unit,
      'supplier_name': instance.supplierName,
    };
