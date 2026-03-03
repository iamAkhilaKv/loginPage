import 'package:experimentlogin/core/app_teme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light=ThemeData(
  useMaterial3: true,

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary:AppColors.secondary,
      surface: AppColors.background,


    ),
      scaffoldBackgroundColor: AppColors.background,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 54,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondary,
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          color: AppColors.textPrimary,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
       // fillColor: AppColors.card,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(color: AppColors.accentViolet),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(color: AppColors.accentViolet),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(color: AppColors.primary),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
      ),),


      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.textPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          // side: BorderSide(
          //   color: AppColors.secondary, // 👈 border color
          //   width: 1.5,
          // ),

        ),



      )
    )
  );

}