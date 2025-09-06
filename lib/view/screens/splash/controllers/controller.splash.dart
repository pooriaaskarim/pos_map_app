import 'dart:async';

import 'package:get/get.dart';

import '../../../common/controllers/controller.app.dart';
import '../../home/views/screen.home.dart';

const Duration _splashSudoDelay = Duration(milliseconds: 380);

class SplashController extends GetxController {
  final RxString splashMessage = 'درحال راه‌اندازی برنامه ...'.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await Get.find<AppController>().onInit();
    await Future.delayed(_splashSudoDelay);
    splashMessage.value = 'خوش آمدید';
    await Future.delayed(_splashSudoDelay);
    unawaited(Get.offAllNamed(HomeScreen.path));
    onClose();
    onDelete();
  }
}
