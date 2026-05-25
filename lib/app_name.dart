import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:starter/core/routing/routing_manager.dart';
import 'package:starter/core/routing/routes.dart';
import 'package:starter/core/styles/app_theme.dart';

class AppName extends StatelessWidget {
  final AppRouter appRouter;

  const AppName({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: Routes.splashRoute,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
