import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/app.text.dart';
import '../controllers/controller.splash.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  static const String routeName = '/splash';
  static const String path = '/';

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 32,
        children: [
          Image.asset('assets/images/map_icon.png', width: 160),

          Obx(() => AppText.bodyLarge(controller.splashMessage.value)),
        ],
      ),
    ),
  );
}
