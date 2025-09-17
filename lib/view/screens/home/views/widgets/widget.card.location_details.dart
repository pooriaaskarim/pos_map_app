import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../../common/widgets/api_status_builder.dart';
import '../../../../common/widgets/app.button.dart';
import '../../../../common/widgets/app.text.dart';
import '../../../../common/widgets/in_app_notification.dart';
import '../../controller/controller.map_widget.dart';

class LocationDetailsCard extends GetView<MapWidgetController> {
  const LocationDetailsCard({super.key});

  @override
  Widget build(final BuildContext context) {
    final themeData = Theme.of(context);
    final backgroundColor = themeData.colorScheme.onSurface;
    final foregroundColor = themeData.colorScheme.surface;
    final ambientColor = themeData.colorScheme.inversePrimary;
    return Obx(
      () => Align(
        alignment: Alignment.bottomCenter,
        child: Card(
          color: backgroundColor.withValues(alpha: 0.8),
          elevation: 8.0,
          shape: ContinuousRectangleBorder(
            side: BorderSide(
              color: ambientColor.withValues(alpha: 0.4),
              width: 2,
            ),
            borderRadius: BorderRadiusGeometry.circular(40),
          ),

          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: AppSizes.points_8,
              vertical: AppSizes.points_16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSizes.points_8,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                      onPressed: controller.startLocation.value == null
                          ? null
                          : () {
                              controller.startLocation.value = null;
                            },
                      icon: Stack(
                        fit: StackFit.passthrough,
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.blueAccent,
                            size: AppSizes.points_32,
                          ),
                          if (controller.startLocation.value != null)
                            const Positioned(
                              bottom: -3,
                              right: -3,
                              child: Icon(
                                Icons.delete_forever_rounded,
                                color: Colors.white,

                                size: AppSizes.points_24,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ApiStatusBuilder(
                        apiStatus: controller.getStartAddressStatus,
                        onIdle: () => AppText.bodyMedium(
                          'یک مبداء انتخاب نمایید.',
                          mergeWith: TextStyle(
                            color: foregroundColor.withValues(alpha: 0.8),
                          ),
                        ),
                        onLoading: (final progress) => AppText.bodyMedium(
                          'در حال بارگذاری آدرس...',
                          mergeWith: TextStyle(color: foregroundColor),
                        ),
                        onFailure: (final failure, final onRetry) =>
                            AppText.rich(
                              TextSpan(
                                text: 'تلاش مجدد',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = onRetry,
                              ),
                              style: themeData.textTheme.bodyMedium?.copyWith(
                                color: themeData.colorScheme.error,
                              ),
                            ),
                        onSuccess: (final address) => Tooltip(
                          message: address,
                          padding: const EdgeInsetsGeometry.symmetric(
                            vertical: AppSizes.points_16,
                            horizontal: AppSizes.points_24,
                          ),

                          preferBelow: false,
                          child: AppText.bodyMedium(
                            address,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            mergeWith: TextStyle(color: foregroundColor),
                          ),
                        ),
                        onRetry: () {
                          if (controller.startLocation.value != null) {
                            controller.getStartAddress();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: ambientColor.withValues(alpha: 0.4),
                  thickness: 2,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                      onPressed: controller.endLocation.value == null
                          ? null
                          : () {
                              controller.endLocation.value = null;
                            },
                      icon: Stack(
                        fit: StackFit.passthrough,
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.my_location_sharp,
                            color: Colors.redAccent,
                            size: AppSizes.points_32,
                          ),
                          if (controller.endLocation.value != null)
                            const Positioned(
                              bottom: -3,
                              right: -3,
                              child: Icon(
                                Icons.delete_forever_rounded,
                                color: Colors.white,

                                size: AppSizes.points_24,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ApiStatusBuilder(
                        apiStatus: controller.getEndAddressStatus,
                        onIdle: () => AppText.bodyMedium(
                          'یک مقصد انتخاب نمایید.',
                          mergeWith: TextStyle(
                            color: foregroundColor.withValues(alpha: 0.8),
                          ),
                        ),
                        onLoading: (final progress) => AppText.bodyMedium(
                          'در حال بارگذاری آدرس...',
                          mergeWith: TextStyle(color: foregroundColor),
                        ),
                        onFailure: (final failure, final onRetry) =>
                            AppText.rich(
                              TextSpan(
                                text: 'تلاش مجدد',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = onRetry,
                              ),
                              style: themeData.textTheme.bodyMedium?.copyWith(
                                color: themeData.colorScheme.error,
                              ),
                            ),
                        onSuccess: (final address) => Tooltip(
                          message: address,
                          padding: const EdgeInsetsGeometry.symmetric(
                            vertical: AppSizes.points_16,
                            horizontal: AppSizes.points_24,
                          ),

                          preferBelow: false,
                          child: AppText.bodyMedium(
                            address,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            mergeWith: TextStyle(color: foregroundColor),
                          ),
                        ),
                        onRetry: () {
                          if (controller.endLocation.value != null) {
                            controller.getEndAddress();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                if (controller.startLocation.value != null &&
                    controller.endLocation.value != null)
                  Divider(color: ambientColor, height: 3),
                if (controller.startLocation.value != null &&
                    controller.endLocation.value != null)
                  ApiStatusBuilder(
                    apiStatus: controller.getRouteStatus,
                    onSuccess: (final route) {
                      final duration = Duration(
                        seconds: route.routes.first.duration.toInt(),
                      );
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: AppSizes.points_4,
                        children: [
                          AppText.titleMedium(
                            'اطلاعات مسیر:',
                            mergeWith: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: foregroundColor.withValues(alpha: 0.8),
                            ),
                          ),
                          Row(
                            children: [
                              AppButton.elevated(
                                onPressed: () {
                                  InAppNotification.success(
                                    message: 'سفر با موفقیت ثبت شد.',
                                  ).show();
                                },

                                text: 'درخواست  سفر',
                              ),
                              Expanded(
                                child: AppText.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'مسیر به طوری تقریبی ',
                                      ),
                                      TextSpan(
                                        text:
                                            '${duration.inHours}:${duration.inMinutes}',
                                        style: themeData.textTheme.bodyLarge
                                            ?.copyWith(
                                              color: foregroundColor,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                      const TextSpan(text: ' رانندگی دارد.'),
                                    ],
                                  ),

                                  style: themeData.textTheme.bodyMedium
                                      ?.copyWith(
                                        color: foregroundColor.withValues(
                                          alpha: 0.8,
                                        ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    onRetry: controller.getRoute,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
