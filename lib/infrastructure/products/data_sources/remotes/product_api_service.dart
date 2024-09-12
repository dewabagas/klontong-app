import 'package:dio/dio.dart';
import 'package:klontong_app/domain/products/requests/store_product_request.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api_service.g.dart';

@RestApi()
abstract class ProductApiService {
  factory ProductApiService(Dio dio, {String? baseUrl}) = _ProductApiService;

  @GET('/new-products')
  Future<HttpResponse> getProducts();

  @POST('/new-products')
  Future<HttpResponse> storeProduct(@Body() StoreProductRequest request);

  @GET('/new-products/{id}')
  Future<HttpResponse> getProductDetail(@Path('id') String id);

  @DELETE('/new-products/{id}')
  Future<HttpResponse> deleteProduct(@Path('id') String id);

  @PUT('/new-products/{id}')
  Future<HttpResponse> updateProduct(
      @Path('id') String id, @Body() StoreProductRequest request);
}
