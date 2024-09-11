import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardGeneral extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final Function()? onTap;
  final bool? hasShadow;
  final double shadowOpacity;
  const CardGeneral(
      {super.key,
      required this.child,
      this.margin,
      this.padding,
      this.color,
      this.borderRadius,
      this.height,
      this.width,
      this.onTap,
      this.hasShadow = true,
      this.shadowOpacity = 0.25});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.h),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
          boxShadow: hasShadow == true
              ? [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: const Color(0xFF3A3A3A).withOpacity(shadowOpacity),
                  )
                ]
              : null,
        ),
        child: child,
      ),
    );
  }
}
