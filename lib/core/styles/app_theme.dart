import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      useMaterial3: true,
    );
  }
}
