import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/shared/others/appbar_label.dart';

class PageListWrapper extends StatelessWidget {
  final String appBarTitle;
  final bool hasBack;
  final Widget child;
  final Widget header;
  final Function? onBackPressed;
  final EdgeInsetsGeometry? padding;
  const PageListWrapper(
      {super.key,
      required this.appBarTitle,
      this.hasBack = true,
      required this.child,
      required this.header,
      this.onBackPressed,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: appbarLabelAlternative(
          title: appBarTitle,
          hasBack: hasBack,
          backgroundColor: AppColors.backgroundGrey,
          borderColor: AppColors.strokeLight,
          titleColor: AppColors.strokeDark,
          onBackPressed: onBackPressed ?? () => GoRouter.of(context).pop()),
      body: SafeArea(
          child: ListView(
        children: [
          header,
          Container(
              color: AppColors.backgroundGrey,
              padding: padding ??
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Stack(children: [
                Container(
                  height: screenHeight,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r)),
                ),
                child
              ])),
        ],
      )),
    );
  }
}
