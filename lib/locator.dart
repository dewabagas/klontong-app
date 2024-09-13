import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:klontong_app/infrastructure/core/network/api_service.dart';
import 'package:klontong_app/infrastructure/products/data_sources/remotes/product_api_service.dart';
import 'package:klontong_app/presentation/routes/app_router.dart';

GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final apiService = ApiService();

  locator.registerLazySingleton<Dio>(() => apiService.dioUnauthorizedClient);
  locator.registerLazySingleton<Dio>(() => apiService.dioAuthorizedClient,
      instanceName: 'AuthorizedClient');

  locator.registerLazySingleton(() => AppRouter());

  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  locator.registerLazySingleton<ProductApiService>(() =>
      ProductApiService(locator.get<Dio>(instanceName: 'AuthorizedClient')));
}
