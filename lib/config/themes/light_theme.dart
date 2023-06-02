import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_fonts.dart';
import '../../core/utils/app_values.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontSize: AppFontSize.s34,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    displaySmall: TextStyle(
      fontSize: AppFontSize.s38,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    titleLarge: TextStyle(
      fontSize: AppFontSize.s28,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: AppFontSize.s26,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: AppFontSize.s22,
      fontWeight: FontWeightManager.semiBold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
        fontSize: AppFontSize.s20,
        fontWeight: FontWeightManager.semiBold,
        color: Colors.black),
    titleMedium: TextStyle(
        fontSize: AppFontSize.s18,
        fontWeight: FontWeightManager.regular,
        color: Colors.black),
    titleSmall: TextStyle(
      fontSize: AppFontSize.s14,
      fontWeight: FontWeightManager.regular,
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.black),
    actionsIconTheme: const IconThemeData(color: Colors.black),
    titleSpacing: AppSize.s20,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: AppSize.s20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  ),
);
