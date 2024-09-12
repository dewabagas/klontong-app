// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_product_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreProductRequest _$StoreProductRequestFromJson(Map<String, dynamic> json) {
  return _StoreProductRequest.fromJson(json);
}

/// @nodoc
mixin _$StoreProductRequest {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String? get supplierName => throw _privateConstructorUsedError;

  /// Serializes this StoreProductRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreProductRequestCopyWith<StoreProductRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreProductRequestCopyWith<$Res> {
  factory $StoreProductRequestCopyWith(
          StoreProductRequest value, $Res Function(StoreProductRequest) then) =
      _$StoreProductRequestCopyWithImpl<$Res, StoreProductRequest>;
  @useResult
  $Res call(
      {String? id,
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
      @JsonKey(name: 'supplier_name') String? supplierName});
}

/// @nodoc
class _$StoreProductRequestCopyWithImpl<$Res, $Val extends StoreProductRequest>
    implements $StoreProductRequestCopyWith<$Res> {
  _$StoreProductRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? sku = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? weight = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? stock = freezed,
    Object? unit = freezed,
    Object? supplierName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreProductRequestImplCopyWith<$Res>
    implements $StoreProductRequestCopyWith<$Res> {
  factory _$$StoreProductRequestImplCopyWith(_$StoreProductRequestImpl value,
          $Res Function(_$StoreProductRequestImpl) then) =
      __$$StoreProductRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
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
      @JsonKey(name: 'supplier_name') String? supplierName});
}

/// @nodoc
class __$$StoreProductRequestImplCopyWithImpl<$Res>
    extends _$StoreProductRequestCopyWithImpl<$Res, _$StoreProductRequestImpl>
    implements _$$StoreProductRequestImplCopyWith<$Res> {
  __$$StoreProductRequestImplCopyWithImpl(_$StoreProductRequestImpl _value,
      $Res Function(_$StoreProductRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? sku = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? weight = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? stock = freezed,
    Object? unit = freezed,
    Object? supplierName = freezed,
  }) {
    return _then(_$StoreProductRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreProductRequestImpl implements _StoreProductRequest {
  _$StoreProductRequestImpl(
      {this.id,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName,
      this.sku,
      this.name,
      this.description,
      this.weight,
      this.image,
      this.price,
      this.stock,
      this.unit,
      @JsonKey(name: 'supplier_name') this.supplierName});

  factory _$StoreProductRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreProductRequestImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  final String? sku;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? weight;
  @override
  final String? image;
  @override
  final double? price;
  @override
  final int? stock;
  @override
  final String? unit;
  @override
  @JsonKey(name: 'supplier_name')
  final String? supplierName;

  @override
  String toString() {
    return 'StoreProductRequest(id: $id, categoryId: $categoryId, categoryName: $categoryName, sku: $sku, name: $name, description: $description, weight: $weight, image: $image, price: $price, stock: $stock, unit: $unit, supplierName: $supplierName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreProductRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, categoryName,
      sku, name, description, weight, image, price, stock, unit, supplierName);

  /// Create a copy of StoreProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreProductRequestImplCopyWith<_$StoreProductRequestImpl> get copyWith =>
      __$$StoreProductRequestImplCopyWithImpl<_$StoreProductRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreProductRequestImplToJson(
      this,
    );
  }
}

abstract class _StoreProductRequest implements StoreProductRequest {
  factory _StoreProductRequest(
          {final String? id,
          @JsonKey(name: 'category_id') final int? categoryId,
          @JsonKey(name: 'category_name') final String? categoryName,
          final String? sku,
          final String? name,
          final String? description,
          final double? weight,
          final String? image,
          final double? price,
          final int? stock,
          final String? unit,
          @JsonKey(name: 'supplier_name') final String? supplierName}) =
      _$StoreProductRequestImpl;

  factory _StoreProductRequest.fromJson(Map<String, dynamic> json) =
      _$StoreProductRequestImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  String? get sku;
  @override
  String? get name;
  @override
  String? get description;
  @override
  double? get weight;
  @override
  String? get image;
  @override
  double? get price;
  @override
  int? get stock;
  @override
  String? get unit;
  @override
  @JsonKey(name: 'supplier_name')
  String? get supplierName;

  /// Create a copy of StoreProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreProductRequestImplCopyWith<_$StoreProductRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
