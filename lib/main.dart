import 'package:dikantin_app_rebuild/app/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    const MyApp(),
  );

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      theme: lightMode,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
