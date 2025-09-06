import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/api_status/api_status.dart';
import '../../../utils/api_status/entity.failure.dart';
import 'app.text.dart';
import 'retry_widget.dart';

class ApiStatusBuilder<T> extends StatelessWidget {
  const ApiStatusBuilder({
    required this.apiStatus,
    required this.onSuccess,
    required this.onRetry,
    this.onIdle,
    this.onLoading,
    this.onFailure,
    super.key,
  });
  final void Function() onRetry;
  final Rx<ApiStatus<T>> apiStatus;
  final Widget Function(double? progress)? onLoading;
  final Widget Function()? onIdle;
  final Widget Function(T result) onSuccess;
  final Widget Function(FailureEntity failure, void Function() onRetry)?
  onFailure;

  @override
  Widget build(final BuildContext context) => Obx(
    () => apiStatus.value.when(
      idle: onIdle ?? () => const SizedBox.shrink(),
      success: onSuccess,
      failure: (final message) =>
          onFailure?.call(message, onRetry) ??
          RetryWidget(
            onRetry: onRetry,
            message: message.message == null
                ? null
                : AppText.labelMedium(message.message!),
          ),
      loading: (final progress) =>
          onLoading?.call(progress) ??
          const Center(child: CircularProgressIndicator()),
    ),
  );
}
