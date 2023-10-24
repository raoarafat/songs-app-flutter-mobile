import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'localization/strings.dart';
import 'presentation/splash/splash_screen.dart';
import 'utils/theme/theme_config.dart';
import 'utils/theme/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return GetMaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: true,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      themeMode: ThemeMode.system,
      translations: Strings(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      home: const SplashScreen(),
    );
  }
}
