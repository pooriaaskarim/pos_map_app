import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';
import '../../../../common/widgets/app.text.dart';
import '../../../../common/widgets/button.map_theme_toggle.dart';
import '../../../../common/widgets/button.theme_toggle.dart';

class MapAppDrawer extends StatelessWidget {
  const MapAppDrawer({super.key});

  @override
  Widget build(final BuildContext context) {
    final themeData = Theme.of(context);
    return Drawer(
      backgroundColor: themeData.colorScheme.surface.withValues(alpha: 0.95),
      shape: const ContinuousRectangleBorder(),
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          vertical: AppSizes.points_32,
          horizontal: AppSizes.points_16,
        ),
        child: Column(
          spacing: AppSizes.points_16,
          children: [
            Column(
              spacing: AppSizes.points_8,
              children: [
                Image.asset('assets/images/map_icon.png', width: 160),
                AppText.displaySmall(
                  'مپ اپ',
                  mergeWith: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Column(
              spacing: AppSizes.points_8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppText.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'تنظیمات تم '),
                      TextSpan(
                        text: 'اپلیکیشن',
                        style: themeData.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                  style: themeData.textTheme.titleMedium,
                ),
                const Center(child: ThemeToggleButton()),
                AppText.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'تنظیمات تم '),
                      TextSpan(
                        text: 'مپ',
                        style: themeData.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                  style: themeData.textTheme.titleMedium,
                ),
                const Center(child: MapThemeToggleButton()),
              ],
            ),
            Expanded(child: Utils.verticalSpacer()),
            Column(
              spacing: AppSizes.points_8,
              children: [
                AppText.bodySmall(
                  'Map App v1.0.0',
                  textAlign: TextAlign.center,
                ),
                AppText.bodyMedium(
                  'Developed with 💙'
                  '\n Github/@pooriaaskarim',
                  textAlign: TextAlign.center,
                ),
                AppText.bodySmall('شهریور ۱۴۰۴', textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
