import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/constants/assets.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';

AppBar appbarLabel(
    {Function? onBackPressed,
    String? title,
    List<Widget>? actions,
    Color? backgroundColor,
    Color? textColor,
    bool hasBack = true}) {
  return AppBar(
    leading: hasBack
        ? IconButton(
            icon: Icon(Icons.arrow_back, color: textColor ?? Colors.white),
            onPressed: onBackPressed as void Function()?)
        : const SizedBox.shrink(),
    title: Text(
      title ?? '',
      style:
          TextStyles.semibold14.copyWith(color: textColor ?? AppColors.white),
    ),
    centerTitle: true,
    backgroundColor: backgroundColor ?? AppColors.primary,
    actions: actions,
    elevation: 0,
  );
}

AppBar appbarLogo(
    {Function? onBackPressed, List<Widget>? actions, bool hasBack = true}) {
  return AppBar(
    leading: hasBack
        ? IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBackPressed as void Function()?)
        : const SizedBox.shrink(),
    title: Image.asset(
      AppImages.imgBrikMix,
      width: 30.w,
      height: 30.w,
    ),
    centerTitle: true,
    backgroundColor: AppColors.primary,
    actions: actions,
    elevation: 0,
  );
}

AppBar appbarLabelAlternative(
    {Function? onBackPressed,
    String? title,
    List<Widget>? actions,
    Color? backgroundColor,
    Color? titleColor,
    Color? borderColor,
    Color? iconColor,
    bool hasBack = true}) {
  return AppBar(
    leading: hasBack
        ? IconButton(
            onPressed: onBackPressed as void Function()?,
            icon: SizedBox(
              width: 32.w,
              height: 32.w,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border:
                      Border.all(color: borderColor ?? AppColors.strokeLight),
                ),
                child: Icon(
                  Icons.chevron_left,
                  color: iconColor ?? AppColors.darkText2,
                ),
              ),
            ),
          )
        : const SizedBox.shrink(),
    title: Text(
      title ?? '',
      style: TextStyles.medium14
          .copyWith(color: titleColor ?? AppColors.strokeDark),
    ),
    centerTitle: true,
    backgroundColor: backgroundColor ?? AppColors.bgLight,
    actions: actions,
    elevation: 0,
  );
}
