import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/constants/strings.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Icon(Icons.search_off, color: AppColors.primary, size: 80.w),
        16.0.height,
        Text(AppStrings.emptyData, style: TextStyles.semibold14)
      ],
    ));
  }
}
