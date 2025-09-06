import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import 'app.button.dart';
import 'app.text.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({
    required this.onRetry,
    this.message,
    this.padding,
    super.key,
  });

  final void Function() onRetry;
  final Widget? message;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(final BuildContext context) => Padding(
    padding:
        padding ??
        const EdgeInsets.symmetric(horizontal: AppSizes.points_32 * 2.5),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          message ??
              AppText.labelMedium('خطایی رخ داد', textAlign: TextAlign.center),
          Utils.verticalSpacer(),
          AppButton.filled(
            onPressed: onRetry,
            text: 'تلاش مجدد',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSizes.points_8,
            ),
          ),
        ],
      ),
    ),
  );
}
