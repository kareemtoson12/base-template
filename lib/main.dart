import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:starter/app_name.dart';
import 'package:starter/core/di/dependency_injection.dart';
import 'package:starter/core/routing/routing_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupGetIt();
  
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: AppName(appRouter: AppRouter()),
    ),
  );
}
