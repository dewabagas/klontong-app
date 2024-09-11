import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:klontong_app/application/splash_cubit/splash_cubit.dart';
import 'package:klontong_app/domain/core/helpers/preference_helper.dart';
import 'package:klontong_app/injection.dart';
import 'package:klontong_app/presentation/core/constants/assets.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';

class PageSplash extends StatelessWidget {
  const PageSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => getIt<SplashCubit>()..initSplash(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.maybeMap(
              loadSuccess: (value) async {
                log('routerName ${value}');
                if (value.routerName == RoutePaths.login) {
                  GoRouter.of(context).pushReplacement(RoutePaths.login);
                } else if (value.routerName == RoutePaths.dashboard) {
                  GoRouter.of(context).pushReplacement(RoutePaths.dashboard);
                } else {
                  removeAllValuesPreference();
                  GoRouter.of(context).pushReplacement(RoutePaths.login);
                }
              },
              orElse: () {});
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Center(
                child: Image.asset(AppImages.imgBrikMix,
                    width: screenWidth / 1.4)),
          ),
        ),
      ),
    );
  }
}
