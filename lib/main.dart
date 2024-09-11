import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/injection.dart';
import 'package:klontong_app/locator.dart';
import 'package:klontong_app/presentation/core/app.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  configureInjection(Environment.dev);
  await initializeDependencies();
  configLoading();

  runApp(const App());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.primary
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.primary
    ..textColor = AppColors.charcoal
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
