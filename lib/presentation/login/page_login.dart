import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klontong_app/application/auths/login_cubit/login_cubit.dart';
import 'package:klontong_app/domain/core/constants/preference_constants.dart';
import 'package:klontong_app/domain/core/helpers/preference_helper.dart';
import 'package:klontong_app/injection.dart';
import 'package:klontong_app/presentation/core/constants/assets.dart';
import 'package:klontong_app/presentation/core/constants/strings.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';
import 'package:klontong_app/presentation/shared/buttons/button_primary.dart';
import 'package:klontong_app/presentation/shared/cards/card_general.dart';
import 'package:klontong_app/presentation/shared/inputs/input_primary.dart';
import 'package:klontong_app/presentation/shared/others/app_snack_bar.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  String? email, password;
  bool isSecured = true;
  bool isBiometricEnabled = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String appVersion = '';
  String buildNumber = '';
  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        appVersion = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
      });
    } catch (e) {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.maybeMap(
              loadInProgress: (value) => EasyLoading.show(),
              loadSuccess: (value) async {
                EasyLoading.dismiss();
                AppSnackBar.showSuccess(context, AppStrings.loginSuccess);
                log('loadSuccess ${value.user}');
                await addBoolToPreference(
                    key: PreferenceConstants.isLoggedIn, value: true);
                await addStringToPreference(
                    key: PreferenceConstants.email,
                    value: '${value.user?.email}');
                GoRouter.of(context).pushReplacement(RoutePaths.dashboard);
              },
              loadFailure: (value) {
                EasyLoading.dismiss();
                AppSnackBar.showError(context,
                    value.failure.message ?? AppStrings.errorMessageGeneral);
              },
              orElse: () {});
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox.shrink(),
                                  Column(
                                    children: [
                                      Text('The Klontonk',
                                          style: TextStyles.semibold22),
                                      8.0.height,
                                      Image.asset(
                                        AppImages.imgBrikMix,
                                        width: screenWidth / 2,
                                      )
                                    ],
                                  ),
                                  const SizedBox.shrink()
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  20.0.height,
                                  CardGeneral(
                                    child: Column(
                                      children: [
                                        InputPrimary(
                                          controller: emailController,
                                          title: 'Email',
                                          hintText: 'Masukkan Email',
                                          filled: true,
                                          filledColor: AppColors.fillColor,
                                          borderColor: AppColors.fillColor,
                                          prefixIcon: const Icon(Icons.person,
                                              color: AppColors.neutral),
                                          onChanged: (String? val) {
                                            setState(() {
                                              email = val;
                                            });
                                          },
                                        ),
                                        10.0.height,
                                        InputPrimary(
                                          controller: passwordController,
                                          title: 'Password',
                                          hintText: 'Masukkan Password',
                                          obscureText: isSecured,
                                          filled: true,
                                          filledColor: AppColors.fillColor,
                                          borderColor: AppColors.fillColor,
                                          prefixIcon: const Icon(
                                              Icons.lock_rounded,
                                              color: AppColors.neutral),
                                          onChanged: (String? val) {
                                            setState(() {
                                              password = val;
                                            });
                                          },
                                          icon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isSecured = !isSecured;
                                              });
                                            },
                                            child: Icon(isSecured
                                                ? Icons.visibility_outlined
                                                : Icons
                                                    .visibility_off_outlined),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // 40.0.height,
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  ButtonPrimary(
                                    title: 'Masuk',
                                    height: 50.h,
                                    onPressed: () {
                                      final email = emailController.text;
                                      final password = passwordController.text;
                                      context
                                          .read<LoginCubit>()
                                          .loginWithEmailAndPassword(
                                              email, password);
                                    },
                                  ),
                                  10.0.height,
                                  ButtonPrimary(
                                    title: 'Daftar',
                                    activeColor: Colors.transparent,
                                    borderColor: AppColors.secondary,
                                    textColor: AppColors.secondary,
                                    height: 50.h,
                                    onPressed: () => GoRouter.of(context)
                                        .push(RoutePaths.register),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Column(
                            children: [
                              Text('Developed by Bagas Dewanggono',
                                  style: TextStyles.bold10),
                              10.0.height,
                              Text('$appVersion ($buildNumber)',
                                  style: TextStyles.regular10),
                              10.0.height,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
