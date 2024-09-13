import 'package:flutter/material.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/shared/cards/card_general.dart';

class CardError extends StatelessWidget {
  final String errorTitle;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final Function()? onTap;
  final bool? hasShadow;
  const CardError(
      {super.key,
      required this.errorTitle,
      this.borderRadius,
      this.height,
      this.width,
      this.onTap,
      this.hasShadow});

  @override
  Widget build(BuildContext context) {
    return CardGeneral(
        onTap: onTap,
        hasShadow: hasShadow,
        height: height,
        width: width,
        color: AppColors.red,
        borderRadius: borderRadius,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: AppColors.white),
            6.0.width,
            Expanded(
              child: Text(errorTitle,
                  style:
                      TextStyles.semibold14.copyWith(color: AppColors.white)),
            ),
          ],
        )));
  }
}
