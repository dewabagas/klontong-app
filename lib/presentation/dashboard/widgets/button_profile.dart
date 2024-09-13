import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';

class ButtonProfile extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String icon;
  const ButtonProfile(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                SvgPicture.asset(icon, width: 16.w, height: 16.w),
                10.0.width,
                Text(title, style: TextStyles.regular12),
              ],
            ),
            Icon(Icons.chevron_right, size: 24.w)
          ]),
          const Divider(color: AppColors.neutral)
        ],
      ),
    );
  }
}
