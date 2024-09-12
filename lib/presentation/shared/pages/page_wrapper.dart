import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/shared/others/appbar_label.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final String? appBarTitle;
  final List<Widget>? appBarActions;
  final Function? onBackPressed;
  final bool resizeToAvoidBottomInset;
  final bool hasBack;
  final Color? backgroundColor;
  final Color? wrapperBackgroundColor;
  final Color? scaffoldBackgroundColor;
  final bool hasContainerBackground;
  final EdgeInsets? padding;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Widget? floatingActionButton;
  const PageWrapper(
      {super.key,
      required this.child,
      this.appBar,
      this.appBarTitle,
      this.appBarActions,
      this.resizeToAvoidBottomInset = true,
      this.hasBack = true,
      this.hasContainerBackground = true,
      this.backgroundColor,
      this.wrapperBackgroundColor,
      this.scaffoldBackgroundColor,
      this.onBackPressed,
      this.padding,
      this.height,
      this.borderRadius,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: scaffoldBackgroundColor,
        floatingActionButton: floatingActionButton,
        appBar: appBar ??
            appbarLabelAlternative(
                title: appBarTitle,
                actions: appBarActions,
                hasBack: hasBack,
                backgroundColor: AppColors.bgLight,
                borderColor: AppColors.strokeLight,
                titleColor: AppColors.strokeDark,
                onBackPressed:
                    onBackPressed ?? () => GoRouter.of(context).pop()),
        body: Container(
            color: AppColors.bgLight,
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Stack(children: [
              Container(
                height: height ?? screenHeight,
                decoration: BoxDecoration(
                    color: hasContainerBackground
                        ? AppColors.white
                        : Colors.transparent,
                    borderRadius: borderRadius ?? BorderRadius.circular(12.r)),
              ),
              child
            ])),
      ),
    );
  }
}
