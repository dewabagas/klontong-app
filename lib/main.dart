import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:klontong_app/firebase_options.dart';
import 'package:klontong_app/injection.dart';
import 'package:klontong_app/locator.dart';
import 'package:klontong_app/presentation/core/app.dart';
import 'package:klontong_app/presentation/core/styles/app_colors.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureInjection(Environment.dev);
  await initializeDependencies();
  configLoading();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://8df3f62beb21776113b05aca4a312136@o4505617706713088.ingest.us.sentry.io/4507944631271424';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const App()),
  );
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
