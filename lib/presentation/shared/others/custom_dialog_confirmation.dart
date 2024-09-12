import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:klontong_app/presentation/shared/buttons/button_primary.dart';

class CustomDialogConfirmation extends StatelessWidget {
  const CustomDialogConfirmation(
      {Key? key,
      this.title,
      this.message,
      this.positiveText,
      this.negativeText,
      required this.actionNegative,
      required this.actionPositiveButton})
      : super(key: key);

  final String? title, message, positiveText, negativeText;
  final Function() actionPositiveButton, actionNegative;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title!, style: TextStyles.medium12),
            SizedBox(
              height: 20.h,
            ),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: TextStyles.regular10,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ButtonPrimary(
                      title: '$negativeText',
                      activeColor: AppColors.secondary,
                      onPressed: actionNegative),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ButtonPrimary(
                      title: '$positiveText', onPressed: actionPositiveButton),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
