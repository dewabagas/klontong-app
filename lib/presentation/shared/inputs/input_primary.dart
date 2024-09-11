import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';

class InputPrimary extends StatelessWidget {
  final String? title;
  final String hintText;
  final bool obscureText;
  final Widget? icon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Color? color;
  final Color? filledColor;
  final Function()? ontaped;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLine;
  final Widget? crossTitle;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final int? maxLength;
  final TextStyle? titleStyle;
  final bool enabled;
  final bool cursor;
  final bool autoFocus;
  final bool filled;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double? height;
  final TextAlign? textAlign;
  const InputPrimary(
      {super.key,
      this.obscureText = false,
      this.title,
      required this.hintText,
      this.enabled = true,
      this.cursor = true,
      this.autoFocus = false,
      this.filled = false,
      this.onChanged,
      this.ontaped,
      this.textInputAction,
      this.icon,
      this.maxLine = 1,
      this.crossTitle,
      this.validator,
      this.controller,
      this.keyboardType,
      this.color,
      this.filledColor,
      this.inputFormatters,
      this.focusNode,
      this.prefixIcon,
      this.prefix,
      this.suffix,
      this.maxLength,
      this.textStyle,
      this.hintStyle,
      this.contentPadding,
      this.borderRadius,
      this.borderColor,
      this.height,
      this.textAlign,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(title ?? '',
                            style: titleStyle ??
                                TextStyles.medium12.copyWith(
                                  color: AppColors.lightText1,
                                )),
                      ),
                      crossTitle ?? const SizedBox()
                    ],
                  ),
                  8.0.height,
                ],
              ),
        TextFormField(
            focusNode: focusNode,
            onChanged: onChanged,
            validator: validator,
            autofocus: autoFocus,
            showCursor: cursor,
            textAlign: textAlign ?? TextAlign.left,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            obscureText: obscureText,
            controller: controller,
            onTap: ontaped,
            maxLines: maxLine,
            maxLength: maxLength,
            style: textStyle ??
                TextStyles.medium12.copyWith(color: AppColors.lightText1),
            decoration: InputDecoration(
              enabled: enabled,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              suffixIcon: icon,
              suffix: suffix,
              prefixIcon: prefixIcon,
              prefix: prefix,
              hintText: hintText,
              filled: filled,
              fillColor: filledColor,
              hintStyle: hintStyle ??
                  TextStyles.regular12.copyWith(color: AppColors.lightText2),
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                borderSide: BorderSide(
                    color: borderColor ?? AppColors.lightText3, width: 1.w),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                borderSide: BorderSide(
                    color: borderColor ?? AppColors.lightText3, width: 1.w),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                borderSide: BorderSide(
                    color: borderColor ?? AppColors.lightText3, width: 1.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            )),
      ],
    );
  }
}
