import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';

double screenWidth =
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
double screenHeight =
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;

class TextStyles {
  static const TextStyle primaryFont = TextStyle(fontFamily: "Poppins");

  static TextStyle _bold(double fontSize) {
    return primaryFont.copyWith(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.lightText1);
  }

  static TextStyle _semiBold(double fontSize) {
    return primaryFont.copyWith(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.lightText1);
  }

  static TextStyle _medium(double fontSize) {
    return primaryFont.copyWith(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.lightText1);
  }

  static TextStyle _regular(double fontSize) {
    return primaryFont.copyWith(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.lightText1);
  }

  static TextStyle _light(double fontSize) {
    return primaryFont.copyWith(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.lightText1);
  }

  static TextStyle bold48 = _bold(48);
  static TextStyle bold64 = _bold(64);
  static TextStyle bold32 = _bold(32);
  static TextStyle bold24 = _bold(24);
  static TextStyle bold20 = _bold(20);
  static TextStyle bold16 = _bold(16);
  static TextStyle bold14 = _bold(14);
  static TextStyle bold12 = _bold(12);
  static TextStyle bold10 = _bold(10);

  static TextStyle semibold30 = _semiBold(30);
  static TextStyle semibold24 = _semiBold(24);
  static TextStyle semibold22 = _semiBold(22);
  static TextStyle semibold20 = _semiBold(20);
  static TextStyle semibold18 = _semiBold(18);
  static TextStyle semibold16 = _semiBold(16);
  static TextStyle semibold14 = _semiBold(14);
  static TextStyle semibold12 = _semiBold(12);
  static TextStyle semibold10 = _semiBold(10);

  static TextStyle medium32 = _medium(32);
  static TextStyle medium24 = _medium(24);
  static TextStyle medium18 = _medium(18);
  static TextStyle medium16 = _medium(16);
  static TextStyle medium14 = _medium(14);
  static TextStyle medium12 = _medium(12);
  static TextStyle medium10 = _medium(10);

  static TextStyle regular18 = _regular(18);
  static TextStyle regular16 = _regular(16);
  static TextStyle regular14 = _regular(14);
  static TextStyle regular12 = _regular(12);
  static TextStyle regular10 = _regular(10);

  static TextStyle light16 = _light(16);
  static TextStyle light14 = _light(14);
  static TextStyle light12 = _light(12);
  static TextStyle light10 = _light(10);
}
