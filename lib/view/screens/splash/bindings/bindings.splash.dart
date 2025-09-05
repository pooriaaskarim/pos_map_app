import 'package:get/get.dart';

import '../controllers/controller.splash.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
