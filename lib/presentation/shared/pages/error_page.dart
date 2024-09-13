// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:klontong_app/presentation/core/constants/strings.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/shared/pages/page_wrapper.dart';

class ErrorPage extends StatelessWidget {
  final String? message;
  final bool hasBack;
  const ErrorPage({
    super.key,
    this.message,
    this.hasBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message ?? AppStrings.errorMessageGeneral,
          textAlign: TextAlign.center, style: TextStyles.medium14),
    );
  }
}
