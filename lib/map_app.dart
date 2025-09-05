import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/common/routes/routes.dart';
import 'view/screens/splash/bindings/bindings.splash.dart';
import 'view/screens/splash/view/screen.splash.dart';

class MapApp extends StatelessWidget {
  const MapApp({super.key});

  @override
  Widget build(final BuildContext context) => GetMaterialApp(
    getPages: Routes.routes,
    home: const SplashScreen(),
    initialBinding: SplashBindings(),
    title: 'Map App',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      fontFamily: 'Roboto',
    ),

    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
        brightness: Brightness.dark,
      ),
      fontFamily: 'Roboto',
    ),
    themeMode: ThemeMode.light,
  );
}
