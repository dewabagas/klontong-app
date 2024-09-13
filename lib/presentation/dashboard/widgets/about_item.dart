import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';

class AboutItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const AboutItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Icon(icon, size: 20.w),
              10.0.width,
              Text(title, style: TextStyles.regular10),
            ],
          ),
          Text(subtitle, style: TextStyles.semibold10),
        ]),
        const Divider(color: AppColors.neutral)
      ],
    );
  }
}
