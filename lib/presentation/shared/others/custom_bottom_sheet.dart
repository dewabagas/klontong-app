import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';

class CustomBottomSheet {
  static showCustomBottomSheet(
      {required BuildContext context, Widget? child, double? height}) async {
    showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            height: height ?? screenHeight * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.r),
                topLeft: Radius.circular(15.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        top: 15.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightText2,
                        boxShadow: const [
                          BoxShadow(
                              color: AppColors.lightText2, spreadRadius: 3),
                        ],
                      ),
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 1.5.h),
                  Expanded(child: child ?? const SizedBox.shrink())
                ],
              ),
            ),
          );
        });
  }

  static Future<T?> showAutoHeightBottomSheet<T>({
    required BuildContext context,
    Widget? child,
  }) async {
    return await showModalBottomSheet<T>(
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        context: context,
        builder: (BuildContext buildContext) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: 15.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lightText2,
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.lightText2, spreadRadius: 3),
                          ],
                        ),
                        alignment: Alignment.center,
                        width: 50.w,
                        height: 1.5.h),
                    child ?? const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          );
        });
  }
}
