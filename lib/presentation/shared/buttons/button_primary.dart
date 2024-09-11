import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.title,
    this.height,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    this.disable = false,
    this.activeColor = AppColors.primary,
    this.disableColor = AppColors.primary,
    this.textColor,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.loading = false,
    this.child,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.textStyle,
    this.buttonPadding,
  });

  final String title;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets? buttonPadding;
  final double? height;
  final Function() onPressed;
  final Color activeColor;
  final Color disableColor;
  final TextStyle? textStyle;
  final bool disable;
  final bool loading;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? child;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 44.h,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
        border: Border.all(
            width: borderWidth ?? 0, color: borderColor ?? Colors.transparent),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              disable ? disableColor.withOpacity(0.35) : activeColor,
          foregroundColor: AppColors.darkText1,
          padding: buttonPadding ??
              EdgeInsets.symmetric(horizontal: 0.w, vertical: 4.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          ),
        ),
        onPressed: disable || loading ? () {} : onPressed,
        child: child ??
            (loading
                ? Padding(
                    padding: EdgeInsets.all(8.h),
                    child: const Center(
                      child:
                          CircularProgressIndicator(color: AppColors.darkText1),
                    ),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (prefixIcon != null) ...[
                              prefixIcon!,
                            ],
                            if (icon != null) ...[
                              icon!,
                            ],
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: textStyle ??
                              TextStyles.semibold14.copyWith(
                                color: textColor ?? AppColors.darkText1,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (suffixIcon != null)
                        Positioned(
                          right: 0,
                          child: suffixIcon!,
                        ),
                    ],
                  )),
      ),
    );
  }
}
