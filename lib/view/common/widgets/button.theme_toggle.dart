import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/controller.app.dart';
import 'app.button.dart';

extension ThemeModeExtension on ThemeMode {
  IconData get icon {
    switch (this) {
      case ThemeMode.system:
        return Icons.brightness_auto;
      case ThemeMode.light:
        return Icons.brightness_7_sharp;
      case ThemeMode.dark:
        return Icons.brightness_4_outlined;
    }
  }

  String get faName => switch (this) {
    ThemeMode.system => 'سیستم',
    ThemeMode.light => 'روشن',
    ThemeMode.dark => 'تیره',
  };
}

class ThemeToggleButton extends GetView<AppController> {
  const ThemeToggleButton({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
    () => AppButton.text(
      onPressed: controller.toggleThemeMode,
      startIcon: Icon(controller.themeMode.value.icon),
      text: controller.themeMode.value.faName,
    ),
  );
}
