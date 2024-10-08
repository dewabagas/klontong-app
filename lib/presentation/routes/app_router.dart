import 'package:go_router/go_router.dart';
import 'package:klontong_app/domain/products/entities/product.dart';
import 'package:klontong_app/presentation/core/pages/page_splash.dart';
import 'package:klontong_app/presentation/dashboard/page_dashboard.dart';
import 'package:klontong_app/presentation/login/page_login.dart';
import 'package:klontong_app/presentation/products/product_addition/page_product_addition.dart';
import 'package:klontong_app/presentation/products/product_detail/page_product_detail.dart';
import 'package:klontong_app/presentation/register/page_register.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';

class AppRouter {
  final GoRouter router = GoRouter(
      initialLocation: RoutePaths.splash,
      routerNeglect: true,
      routes: [
        GoRoute(
            path: RoutePaths.splash,
            builder: (context, state) => const PageSplash()),
        GoRoute(
            path: RoutePaths.login,
            builder: (context, state) => const PageLogin()),
        GoRoute(
            path: RoutePaths.register,
            builder: (context, state) => const PageRegister()),
        GoRoute(
            path: RoutePaths.dashboard,
            builder: (context, state) => const PageDashboard()),
        GoRoute(
            path: RoutePaths.productAddition,
            builder: (context, state) {
              final args = state.extra as Map<String, dynamic>;
              final Product? product = args['product'] as Product?;
              return PageProductAddition(product: product);
            }),
        GoRoute(
            path: RoutePaths.productDetail,
            builder: (context, state) => const PageProductDetail()),
      ]);
}
