import 'package:flutter/material.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';
import 'package:miniapp_telegram_final/res/colors/light_color.dart';

import 'package:skeletonizer/skeletonizer.dart';

ThemeData lightTheme() {
  return ThemeData(
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.corner8))))),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: false,
          color: LightColor.primaryColor,
          iconTheme: IconThemeData(color: LightColor.onPrimaryColor)),
      textTheme: TextTheme(
          bodyMedium:
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          titleLarge: const TextStyle(fontSize: 20),
          bodySmall: TextStyle(
              color: LightColor.secondTextColor, fontWeight: FontWeight.w500)),
      // textTheme: TextTheme(),
      scaffoldBackgroundColor: LightColor.bgColor,
      fontFamily: 'IranYekanX',
      highlightColor: Colors.grey.shade300,
      extensions: const [
        SkeletonizerConfigData(), // default constructor has light theme config
      ],
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: LightColor.primaryColor,
          onPrimary: LightColor.onPrimaryColor,
          outline: LightColor.outline,
          outlineVariant: LightColor.outlineVariant,
          secondary: LightColor.secondaryColor,
          onSecondary: LightColor.onSecondaryColor,
          error: LightColor.errorColor,
          onError: LightColor.onErrorColor,
          surface: LightColor.surfaceColor,
          onSurface: LightColor.onSurfaceColor));
}
