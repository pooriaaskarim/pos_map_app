import 'package:get/get.dart';

import '../../screens/home/views/screen.home.dart';
import '../../screens/splash/bindings/bindings.splash.dart';
import '../../screens/splash/view/screen.splash.dart';

class Routes {
  const Routes._();
  static List<GetPage> get routes => [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      children: const [],
    ),
  ];
}
