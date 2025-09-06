import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../controller/controller.map_widget.dart';
import 'widget.card.location_details.dart';
import 'widget.user_location_button.dart';

class MapBottomBar extends GetView<MapWidgetController> {
  const MapBottomBar({super.key});

  @override
  Widget build(final BuildContext context) {
    final themeData = Theme.of(context);
    final backgroundColor = themeData.colorScheme.surface;
    final foregroundColor = themeData.colorScheme.onSurface;
    return Obx(
      () => Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: GestureDetector(
          onVerticalDragUpdate: (final details) {
            print(details.localPosition.dy);
            if (details.localPosition.dy <= -100) {
              controller.isFullScreen.value = false;
            }
            if (details.localPosition.dy >= 150) {
              controller.isFullScreen.value = true;
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 280),
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: AppSizes.points_16,
              vertical: AppSizes.points_24,
            ),
            curve: Curves.easeInOutBack,
            decoration: BoxDecoration(
              gradient: controller.isFullScreen.value
                  ? LinearGradient(
                      colors: [
                        Colors.transparent,
                        foregroundColor.withValues(alpha: 0.2),
                        foregroundColor.withValues(alpha: 0.6),
                        foregroundColor,
                      ],
                      stops: const [0.0, 0.3, 0.6, 1.0],
                      begin: Alignment.topCenter,

                      end: Alignment.bottomCenter,
                    )
                  : null,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 180),
                      sizeCurve: Curves.slowMiddle,
                      crossFadeState: controller.isFullScreen.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Icon(
                        Icons.fullscreen_exit,
                        size: AppSizes.points_56,
                        color: backgroundColor.withValues(alpha: 0.6),
                      ),
                      secondChild: Icon(
                        Icons.fullscreen,
                        size: AppSizes.points_56,
                        color: foregroundColor.withValues(alpha: 0.6),
                      ),
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 180),
                      sizeCurve: Curves.slowMiddle,
                      crossFadeState: controller.isFullScreen.value
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: Icon(
                        Icons.keyboard_arrow_down,
                        size: AppSizes.points_64,
                        color: foregroundColor.withValues(alpha: 0.6),
                      ),
                      secondChild: Icon(
                        Icons.keyboard_arrow_up,
                        size: AppSizes.points_64,
                        color: backgroundColor.withValues(alpha: 0.6),
                      ),
                    ),
                    const UserLocationButton(),
                  ],
                ),
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 180),
                  sizeCurve: Easing.emphasizedAccelerate,
                  crossFadeState: controller.isFullScreen.value
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: const LocationDetailsCard(),
                  secondChild: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
