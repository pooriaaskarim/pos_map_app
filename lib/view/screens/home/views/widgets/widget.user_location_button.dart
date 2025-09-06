import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../controller/controller.map_widget.dart';

class UserLocationButton extends GetView<MapWidgetController> {
  const UserLocationButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final themeData = Theme.of(context);
    return Obx(() {
      const iconSize = AppSizes.points_40;

      return Stack(
        fit: StackFit.passthrough,
        children: [
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(
                themeData.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              shape: WidgetStatePropertyAll<OutlinedBorder>(
                CircleBorder(
                  side: controller.isRetrievingUserLocation.value
                      ? BorderSide.none
                      : BorderSide(
                          color: themeData.colorScheme.inversePrimary,
                          width: 2,
                        ),
                ),
              ),
            ),
            onPressed: controller.retrieveUserLocation,
            iconSize: iconSize,
            icon: Icon(
              Icons.my_location,
              color: themeData.colorScheme.inversePrimary,
            ),
          ),
          if (controller.isRetrievingUserLocation.value)
            Positioned.fill(
              child: SizedBox.square(
                dimension: iconSize + 10,
                child: CircularProgressIndicator(
                  padding: EdgeInsets.zero,
                  strokeWidth: 2,
                  color: themeData.colorScheme.inversePrimary,
                ),
              ),
            ),
        ],
      );
    });
  }
}
