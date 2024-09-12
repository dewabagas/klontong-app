import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';
import 'package:klontong_app/domain/core/entities/general_response.dart';
import 'package:klontong_app/domain/products/entities/product.dart';
import 'package:klontong_app/domain/products/interfaces/i_product_repository.dart';
import 'package:klontong_app/domain/products/requests/store_product_request.dart';
import 'package:klontong_app/infrastructure/core/models/general_response_dto.dart';
import 'package:klontong_app/infrastructure/products/data_sources/remotes/product_api_service.dart';
import 'package:klontong_app/infrastructure/products/models/product_dto.dart';
import 'package:klontong_app/injection.dart';

@LazySingleton(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final ProductApiService apiService = getIt<ProductApiService>();

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      List<Product> products = [];
      var response = await apiService.getProducts();
      if (response.data != null) {
        final body = response.data;
        final result = body is String ? jsonDecode(body) : body;
        products = ProductDto.fromJsonList(result);
      } else {
        throw GeneralException(message: 'Invalid Request');
      }
      return Right(products);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, GeneralResponse>> storeProduct(
      StoreProductRequest request) async {
    try {
      GeneralResponse? user;
      var response = await apiService.storeProduct(request);
      if (response.data != null) {
        final body = response.data;
        final result = body is String ? jsonDecode(body) : body;
        user = GeneralResponseDto.fromJson(result).toDomain();
      } else {
        throw GeneralException(message: 'Invalid Request');
      }
      return Right(user);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, GeneralResponse>> deleteProduct(String id) async {
    try {
      GeneralResponse? user;
      var response = await apiService.deleteProduct(id);
      if (response.data != null) {
        final body = response.data;
        final result = body is String ? jsonDecode(body) : body;
        user = GeneralResponseDto.fromJson(result).toDomain();
      } else {
        throw GeneralException(message: 'Invalid Request');
      }
      return Right(user);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetail(String id) async {
    try {
      Product? product;
      var response = await apiService.getProductDetail(id);
      if (response.data != null) {
        final body = response.data;
        final result = body is String ? jsonDecode(body) : body;
        product = ProductDto.fromJson(result).toDomain();
      } else {
        throw GeneralException(message: 'Invalid Request');
      }
      return Right(product);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, GeneralResponse>> updateProduct(
      String id, StoreProductRequest request) async {
    try {
      GeneralResponse? user;
      var response = await apiService.updateProduct(id, request);
      if (response.data != null) {
        final body = response.data;
        final result = body is String ? jsonDecode(body) : body;
        user = GeneralResponseDto.fromJson(result).toDomain();
      } else {
        throw GeneralException(message: 'Invalid Request');
      }
      return Right(user);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(message: e.message));
    }
  }
}
