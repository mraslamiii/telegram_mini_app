import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/res/style.dart';

import 'core/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme(),
      locale: const Locale('fa'),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
