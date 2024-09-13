// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:klontong_app/application/auths/login_cubit/login_cubit.dart'
    as _i21;
import 'package:klontong_app/application/auths/logout_cubit/logout_cubit.dart'
    as _i847;
import 'package:klontong_app/application/auths/register_cubit/register_cubit.dart'
    as _i953;
import 'package:klontong_app/application/products/delete_product_cubit/delete_product_cubit.dart'
    as _i398;
import 'package:klontong_app/application/products/product_detail_cubit/product_detail_cubit.dart'
    as _i1009;
import 'package:klontong_app/application/products/products_bloc/products_bloc.dart'
    as _i775;
import 'package:klontong_app/application/products/store_product_cubit/store_product_cubit.dart'
    as _i1019;
import 'package:klontong_app/application/products/update_product_cubit/update_product_cubit.dart'
    as _i173;
import 'package:klontong_app/application/splash_cubit/splash_cubit.dart'
    as _i50;
import 'package:klontong_app/domain/products/interfaces/i_product_repository.dart'
    as _i443;
import 'package:klontong_app/infrastructure/products/repositories/product_repository.dart'
    as _i815;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i50.SplashCubit>(() => _i50.SplashCubit());
    gh.lazySingleton<_i443.IProductRepository>(() => _i815.ProductRepository());
    gh.factory<_i953.RegisterCubit>(
        () => _i953.RegisterCubit(gh<_i59.FirebaseAuth>()));
    gh.factory<_i21.LoginCubit>(() => _i21.LoginCubit(gh<_i59.FirebaseAuth>()));
    gh.factory<_i847.LogoutCubit>(
        () => _i847.LogoutCubit(gh<_i59.FirebaseAuth>()));
    gh.factory<_i398.DeleteProductCubit>(
        () => _i398.DeleteProductCubit(gh<_i443.IProductRepository>()));
    gh.factory<_i775.ProductsBloc>(
        () => _i775.ProductsBloc(gh<_i443.IProductRepository>()));
    gh.factory<_i1009.ProductDetailCubit>(
        () => _i1009.ProductDetailCubit(gh<_i443.IProductRepository>()));
    gh.factory<_i1019.StoreProductCubit>(
        () => _i1019.StoreProductCubit(gh<_i443.IProductRepository>()));
    gh.factory<_i173.UpdateProductCubit>(
        () => _i173.UpdateProductCubit(gh<_i443.IProductRepository>()));
    return this;
  }
}
