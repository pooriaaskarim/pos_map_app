import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../utils/api_status/api_status.dart';
import '../../../utils/api_status/entity.failure.dart';
import 'in_app_notification.dart';

class ApiStatusListener<T> extends StatelessWidget {
  const ApiStatusListener({
    required this.apiStatus,
    required this.child,
    this.onSuccess,
    this.onFailure,
    this.onLoading,
    super.key,
  }) : assert(
         onSuccess != null || onFailure != null,
         '''Incorrect use of ApiStatusListener, at least one of onSuccess or onFailure methods should be provided''',
       );

  final void Function(FailureEntity failure)? onFailure;
  final void Function(T result)? onSuccess;
  final void Function(double? progress)? onLoading;
  final Rx<ApiStatus<T>> apiStatus;
  final Widget child;

  void _onStatusChanged(
    final ApiStatus<T> apiStatus,
    final BuildContext context,
  ) => apiStatus.maybeWhen(
    orElse: () => null,
    loading: (final progress) => onLoading?.call(progress),
    failure: (final message) => onFailure != null
        ? onFailure!.call(message)
        : InAppNotification.error(message: message.message ?? '').show(),
    success: (final result) => onSuccess?.call(result),
  );

  @override
  Widget build(final BuildContext context) => RxListener<ApiStatus<T>>(
    listenable: apiStatus,
    onChanged: (final v) => _onStatusChanged.call(v, context),
    child: child,
  );
}

class RxListener<T> extends StatefulWidget {
  const RxListener({
    required this.listenable,
    required this.child,
    required this.onChanged,
    super.key,
  });

  final void Function(T value) onChanged;
  final Rx<T> listenable;
  final Widget child;

  @override
  State<RxListener<T>> createState() => _RxListenerState<T>();
}

class _RxListenerState<T> extends State<RxListener<T>> {
  late final StreamSubscription<T> apiStatusStream;

  @override
  void initState() {
    apiStatusStream = widget.listenable.listen(_onStatusChanged);
    super.initState();
  }

  void _onStatusChanged(final T value) => widget.onChanged(value);

  @override
  void dispose() {
    apiStatusStream.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => widget.child;
}
