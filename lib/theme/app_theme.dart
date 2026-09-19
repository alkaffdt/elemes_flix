import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primary,
    fontFamily: GoogleFonts.openSans().fontFamily,
    textTheme: GoogleFonts.openSansTextTheme().copyWith(
      displayLarge: const TextStyle(color: AppColors.textColor),
      displayMedium: const TextStyle(color: AppColors.textColor),
      displaySmall: const TextStyle(color: AppColors.textColor),
      headlineLarge: const TextStyle(color: AppColors.textColor),
      headlineMedium: const TextStyle(color: AppColors.textColor),
      headlineSmall: const TextStyle(color: AppColors.textColor),
      titleLarge: const TextStyle(color: AppColors.textColor),
      titleMedium: const TextStyle(color: AppColors.textColor),
      titleSmall: const TextStyle(color: AppColors.textColor),
      bodyLarge: const TextStyle(color: AppColors.textColor),
      bodyMedium: TextStyle(color: AppColors.textColor.withOpacity(0.75)),
      bodySmall: TextStyle(color: AppColors.textColor.withOpacity(0.6)),
      labelLarge: const TextStyle(color: AppColors.textColor),
      labelMedium: const TextStyle(color: AppColors.textColor),
      labelSmall: TextStyle(color: AppColors.textColor.withOpacity(0.6)),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.secondary,
      error: AppColors.errorColor,
      onPrimary: AppColors.textButtonColor,
      onSurface: AppColors.textColor,
    ),
    appBarTheme: appBarTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textButtonColor,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      selectedItemColor: AppColors.textColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColors.textColor,
      unselectedLabelColor: Colors.grey,
      indicatorColor: AppColors.primary,
    ),
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: AppColors.textColor),
    titleTextStyle: TextStyle(
      color: AppColors.primary,
      fontSize: 22,
      fontWeight: FontWeight.w800,
    ),
  );
}
