import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/controller.app.dart';
import 'app.button.dart';

class MapThemeToggleButton extends GetView<AppController> {
  const MapThemeToggleButton({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
    () => AppButton.text(
      onPressed: controller.toggleMapTheme,
      text: controller.mapTheme.value.faName,
    ),
  );
}
