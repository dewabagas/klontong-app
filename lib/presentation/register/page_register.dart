import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klontong_app/application/auths/register_cubit/register_cubit.dart';
import 'package:klontong_app/injection.dart';
import 'package:klontong_app/presentation/core/constants/strings.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/core/utils/validation_utils.dart';
import 'package:klontong_app/presentation/routes/app_route_paths.dart';
import 'package:klontong_app/presentation/shared/buttons/button_primary.dart';
import 'package:klontong_app/presentation/shared/cards/card_general.dart';
import 'package:klontong_app/presentation/shared/inputs/input_primary.dart';
import 'package:klontong_app/presentation/shared/others/app_snack_bar.dart';
import 'package:klontong_app/presentation/shared/pages/page_wrapper.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double passwordStrength = 0.0;
  Color passwordStrengthColor = Colors.red;
  String passwordStrengthText = '';

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void _checkPasswordStrength(String value) {
    if (value.isEmpty) {
      setState(() {
        passwordStrength = 0.0;
        passwordStrengthColor = Colors.red;
        passwordStrengthText = '';
      });
    } else if (value.length >= 8 &&
        RegExp(r'^(?=.*[A-Za-z])(?=.*[0-9]).{8,}$').hasMatch(value)) {
      if (value.length > 8 &&
          RegExp(r'^(?=.*[!@#\$&*~]).{9,}$').hasMatch(value)) {
        setState(() {
          passwordStrength = 1.0;
          passwordStrengthColor = Colors.green;
          passwordStrengthText = 'Kuat';
        });
      } else {
        setState(() {
          passwordStrength = 0.66;
          passwordStrengthColor = Colors.orange;
          passwordStrengthText = 'Sedang';
        });
      }
    } else {
      setState(() {
        passwordStrength = 0.33;
        passwordStrengthColor = Colors.red;
        passwordStrengthText = 'Lemah';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => getIt<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          state.maybeMap(
              loadInProgress: (value) => EasyLoading.show(),
              loadSuccess: (value) {
                EasyLoading.dismiss();
                AppSnackBar.showSuccess(context, 'Berhasil Mendaftarkan Akun');
                GoRouter.of(context).pushReplacement(RoutePaths.login);
              },
              loadFailure: (value) {
                EasyLoading.dismiss();
                AppSnackBar.showError(context,
                    value.failure.message ?? AppStrings.errorMessageGeneral);
              },
              orElse: () {});
        },
        builder: (context, state) {
          return Stack(
            children: [
              PageWrapper(
                appBarTitle: 'Daftar',
                child: SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputPrimary(
                            controller: emailController,
                            title: 'Email',
                            hintText: 'Email',
                            filled: true,
                            filledColor: AppColors.white,
                            validator: validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          16.0.height,
                          InputPrimary(
                            controller: passwordController,
                            title: 'Password',
                            hintText: 'Password',
                            filled: true,
                            filledColor: AppColors.white,
                            obscureText: !isPasswordVisible,
                            validator: validatePassword,
                            onChanged: _checkPasswordStrength,
                            icon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              child: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 16.w,
                              ),
                            ),
                          ),
                          8.0.height,
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 12.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    3,
                                    (index) {
                                      final double start = index * 0.33;
                                      final double end = (index + 1) * 0.33;

                                      final double value = passwordStrength >=
                                              end
                                          ? 1
                                          : passwordStrength <= start
                                              ? 0
                                              : (passwordStrength - start) * 3;
                                      return Expanded(
                                        flex: 1,
                                        child: LinearProgressIndicator(
                                          value: value,
                                          minHeight: 5.h,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          backgroundColor: AppColors.lightGrey,
                                          color: passwordStrengthColor,
                                        ),
                                      );
                                    },
                                  )
                                      .expand((element) =>
                                          [element, SizedBox(width: 4.w)])
                                      .toList()
                                      .sublist(0, 5),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  passwordStrengthText,
                                  style: TextStyle(
                                    color: passwordStrengthColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          8.0.height,
                          InputPrimary(
                            controller: confirmPasswordController,
                            title: 'Ulangi Password',
                            hintText: 'Ulangi Password',
                            filled: true,
                            filledColor: AppColors.white,
                            obscureText: !isConfirmPasswordVisible,
                            validator: (value) => validateConfirmPassword(
                                value, passwordController.text),
                            icon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible;
                                });
                              },
                              child: Icon(
                                isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 16.w,
                              ),
                            ),
                          ),
                          100.0.height,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CardGeneral(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.r),
                      topRight: Radius.circular(18.r)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  child: ButtonPrimary(
                    title: 'Daftar',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context
                            .read<RegisterCubit>()
                            .registerWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      }
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
