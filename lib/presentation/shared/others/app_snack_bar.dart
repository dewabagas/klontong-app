import 'package:flutter/material.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppSnackBar {
  static showError(BuildContext context, String message) {
    _showSnackBar(context, message, SnackBarType.error);
  }

  static showSuccess(BuildContext context, String message) {
    _showSnackBar(context, message, SnackBarType.success);
  }

  static showInfo(BuildContext context, String message) {
    _showSnackBar(context, message, SnackBarType.info);
  }

  static void _showSnackBar(
      BuildContext context, String message, SnackBarType type) {
    showTopSnackBar(
      Overlay.of(context),
      _buildSnackBar(message, type),
    );
  }

  static CustomSnackBar _buildSnackBar(String message, SnackBarType type) {
    switch (type) {
      case SnackBarType.error:
        return CustomSnackBar.error(
          message: message,
          textStyle: TextStyles.semibold12.copyWith(color: AppColors.white),
        );
      case SnackBarType.success:
        return CustomSnackBar.success(
          message: message,
          textStyle: TextStyles.semibold12.copyWith(color: AppColors.white),
        );
      case SnackBarType.info:
        return CustomSnackBar.info(
          message: message,
          textStyle: TextStyles.semibold12.copyWith(color: AppColors.white),
        );
      default:
        return CustomSnackBar.info(
          message: message,
          textStyle: TextStyles.semibold12.copyWith(color: AppColors.white),
        );
    }
  }
}

enum SnackBarType { error, success, info }
