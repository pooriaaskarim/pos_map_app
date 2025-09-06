import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../../common/widgets/app.button.dart';
import '../../../../common/widgets/app.text.dart';

class RequestLocationPermissionsDialog extends StatelessWidget {
  const RequestLocationPermissionsDialog({super.key});

  @override
  Widget build(final BuildContext context) {
    final themeData = Theme.of(context);
    return AlertDialog(
      icon: Icon(
        Icons.add_location_rounded,
        size: AppSizes.points_48,
        color: themeData.colorScheme.primary,
      ),
      title: AppText.titleLarge(
        'دسترسی موقعیت مکانی',
        mergeWith: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: AppText(
        'برای تجربه‌ی کاربری بهتر، دسترسی به موقیعت مکانی را فعال کنید.',
      ),
      iconPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.points_8,
        vertical: AppSizes.points_16,
      ),
      actions: [
        AppButton.text(onPressed: () => Get.back(result: false), text: 'خیر'),
        AppButton.text(
          onPressed: () => Get.back(result: true),
          text: 'باشه!',
          textStyle: themeData.textTheme.bodyLarge?.copyWith(
            color: themeData.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
