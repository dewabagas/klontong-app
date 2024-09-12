import 'package:dartz/dartz.dart';
import 'package:klontong_app/domain/core/common/error/failure.dart';
import 'package:klontong_app/domain/core/entities/general_response.dart';
import 'package:klontong_app/domain/products/entities/product.dart';
import 'package:klontong_app/domain/products/requests/store_product_request.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, GeneralResponse>> storeProduct(
      StoreProductRequest request);
  Future<Either<Failure, Product>> getProductDetail(String id);

  Future<Either<Failure, GeneralResponse>> updateProduct(
      String id, StoreProductRequest request);
  Future<Either<Failure, GeneralResponse>> deleteProduct(String id);
}
