import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final BorderRadius borderRadius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final outerRect = Offset.zero & size;
    final path = Path()..addRRect(borderRadius.toRRect(outerRect));

    final dashPath = Path();
    double dashWidth = this.dashWidth,
        dashSpace = this.dashSpace,
        distance = 0.0;

    for (final metric in path.computeMetrics()) {
      while (distance < metric.length) {
        final start = distance;
        final end = (distance + dashWidth).clamp(0.0, metric.length);
        dashPath.addPath(metric.extractPath(start, end), Offset.zero);
        distance = end + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CardDashed extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final Widget? child;

  const CardDashed({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(width.w, height.h),
            painter: DashedBorderPainter(
              color: AppColors.grey2,
              strokeWidth: 2.0.r,
              dashWidth: 5.0.r,
              dashSpace: 3.0.r,
              borderRadius: borderRadius ?? BorderRadius.circular(15.r),
            ),
          ),
          if (child != null) Container(child: child),
        ],
      ),
    );
  }
}
