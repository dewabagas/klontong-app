import 'package:flutter/material.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        primary: isDarkTheme ? AppColors.primary : AppColors.primary,
        onPrimary: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        secondary: AppColors.secondary,
        onSecondary: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        error: AppColors.errorColor,
        onError: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        background: isDarkTheme ? AppColors.bgDark : AppColors.bgLight,
        onBackground: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        surface: isDarkTheme ? AppColors.cardDark : AppColors.cardLight,
        onSurface: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        onSurfaceVariant:
            isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        surfaceVariant:
            isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        surfaceTint: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        onInverseSurface:
            isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        inverseSurface:
            isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
      ),
      useMaterial3: false,
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.bgDark : AppColors.bgLight,
      primarySwatch: Colors.teal,
      indicatorColor: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
      hintColor: isDarkTheme ? AppColors.darkText2 : AppColors.darkText2,
      highlightColor: isDarkTheme ? AppColors.darkText3 : AppColors.lightText2,
      hoverColor: isDarkTheme ? Colors.black12 : Colors.white12,
      focusColor: isDarkTheme ? AppColors.primary : AppColors.primary,
      disabledColor: isDarkTheme ? AppColors.grayColor : AppColors.grayColor,
      fontFamily: "Greenwich",
      datePickerTheme: DatePickerThemeData(
        shadowColor: AppColors.strokeDark,
        backgroundColor: isDarkTheme ? AppColors.bgDark : AppColors.bgLight,
        surfaceTintColor:
            isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        headerBackgroundColor:
            isDarkTheme ? AppColors.cardDark : AppColors.cardLight,
        headerHeadlineStyle: TextStyles.medium12.copyWith(
            color: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1),
        headerHelpStyle: TextStyles.medium12.copyWith(
            color: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1),
        headerForegroundColor:
            isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        yearStyle: TextStyles.medium12.copyWith(
            color: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1),
        dayStyle: TextStyles.medium12.copyWith(
            color: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1),
        weekdayStyle: TextStyles.medium12.copyWith(
            color: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1),
        dividerColor: isDarkTheme ? AppColors.darkText1 : AppColors.lightText1,
        dayForegroundColor: MaterialStateColor.resolveWith((states) {
          return isDarkTheme ? AppColors.darkText1 : AppColors.lightText1;
        }),
        dayOverlayColor: MaterialStateColor.resolveWith((states) {
          return isDarkTheme ? AppColors.darkText1 : AppColors.lightText1;
        }),
        yearForegroundColor: MaterialStateColor.resolveWith((states) {
          return isDarkTheme ? AppColors.darkText1 : AppColors.lightText1;
        }),
      ),
      splashColor:
          isDarkTheme ? const Color(0xFF1F1F1F) : const Color(0xffEEF0F4),
      cardColor: isDarkTheme ? AppColors.cardDark : AppColors.cardLight,
      canvasColor: isDarkTheme ? AppColors.strokeDark : AppColors.lightText3,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: AppBarTheme(
          elevation: 0.5,
          backgroundColor: isDarkTheme ? AppColors.bgDark : AppColors.bgLight),
    );
  }
}
