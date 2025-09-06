import 'package:flutter/material.dart';

import '../../../utils/api_status/api_status.dart';
import '../../../utils/api_status/entity.failure.dart';
import '../../../utils/utils.dart';
import 'app.text.dart';

const _defaultPadding = EdgeInsets.all(AppSizes.points_4);

class AppButton<T> extends StatefulWidget {
  factory AppButton.text({
    required final String text,
    required final void Function()? onPressed,
    final void Function()? onLongPressed,
    final ApiStatus<T>? apiStatus,
    final void Function(FailureEntity failure)? onFailure,
    final void Function(T result)? onSuccess,
    final void Function(double? progress)? onLoading,
    final Widget? startIcon,
    final Widget? endIcon,
    final ButtonStyle? style,
    final EdgeInsetsGeometry contentPadding = _defaultPadding,
    final TextStyle? textStyle,
    final Widget Function(double? progress)? loadingWidgetBuilder,
    final Key? key,
  }) => AppButton(
    textStyle: textStyle,
    onPressed: onPressed,
    apiStatus: apiStatus,
    onFailure: onFailure,
    onLoading: onLoading,
    onSuccess: onSuccess,
    onLongPressed: onLongPressed,
    startIcon: startIcon,
    endIcon: endIcon,
    loadingWidgetBuilder: loadingWidgetBuilder,
    style: style,
    contentPadding: contentPadding,
    text: text,
    type: AppButtonType.text,
    key: key,
  );

  const AppButton({
    required this.onPressed,
    required this.text,
    this.apiStatus,
    this.onFailure,
    this.onSuccess,
    this.onLoading,
    this.startIcon,
    this.endIcon,
    this.textStyle,
    this.onLongPressed,
    this.style,
    this.type = AppButtonType.filled,
    this.contentPadding = _defaultPadding,
    this.loadingWidgetBuilder,
    super.key,
  });

  factory AppButton.outlined({
    required final String text,
    required final void Function()? onPressed,
    final void Function()? onLongPressed,
    final ApiStatus<T>? apiStatus,
    final void Function(FailureEntity failure)? onFailure,
    final void Function(T result)? onSuccess,
    final void Function(double? progress)? onLoading,
    final Widget? startIcon,
    final Widget? endIcon,
    final ButtonStyle? style,
    final EdgeInsetsGeometry contentPadding = _defaultPadding,
    final TextStyle? textStyle,
    final Widget Function(double? progress)? loadingWidgetBuilder,
    final Key? key,
  }) => AppButton(
    textStyle: textStyle,
    onPressed: onPressed,
    onLongPressed: onLongPressed,
    apiStatus: apiStatus,
    onFailure: onFailure,
    onLoading: onLoading,
    onSuccess: onSuccess,
    startIcon: startIcon,
    endIcon: endIcon,
    loadingWidgetBuilder: loadingWidgetBuilder,
    style: style,
    contentPadding: contentPadding,
    text: text,
    key: key,
    type: AppButtonType.outlined,
  );

  factory AppButton.filled({
    required final String text,
    required final void Function()? onPressed,
    final void Function()? onLongPressed,
    final ApiStatus<T>? apiStatus,
    final void Function(FailureEntity failure)? onFailure,
    final void Function(T result)? onSuccess,
    final void Function(double? progress)? onLoading,
    final Widget? startIcon,
    final Widget? endIcon,
    final ButtonStyle? style,
    final EdgeInsetsGeometry contentPadding = _defaultPadding,
    final TextStyle? textStyle,
    final Widget Function(double? progress)? loadingWidgetBuilder,
    final Key? key,
  }) => AppButton(
    textStyle: textStyle,
    onPressed: onPressed,
    onLongPressed: onLongPressed,
    apiStatus: apiStatus,
    onFailure: onFailure,
    onLoading: onLoading,
    onSuccess: onSuccess,
    startIcon: startIcon,
    endIcon: endIcon,
    loadingWidgetBuilder: loadingWidgetBuilder,
    style: style,
    contentPadding: contentPadding,
    text: text,
    key: key,
    type: AppButtonType.filled,
  );

  factory AppButton.elevated({
    required final String text,
    required final void Function()? onPressed,
    final void Function()? onLongPressed,
    final ApiStatus<T>? apiStatus,
    final void Function(FailureEntity failure)? onFailure,
    final void Function(T result)? onSuccess,
    final void Function(double? progress)? onLoading,
    final Widget? startIcon,
    final Widget? endIcon,
    final ButtonStyle? style,
    final EdgeInsetsGeometry contentPadding = _defaultPadding,
    final TextStyle? textStyle,
    final Widget Function(double? progress)? loadingWidgetBuilder,
    final Key? key,
  }) => AppButton(
    textStyle: textStyle,
    onPressed: onPressed,
    onLongPressed: onLongPressed,
    apiStatus: apiStatus,
    onFailure: onFailure,
    onLoading: onLoading,
    onSuccess: onSuccess,
    startIcon: startIcon,
    endIcon: endIcon,
    loadingWidgetBuilder: loadingWidgetBuilder,
    style: style,
    contentPadding: contentPadding,
    text: text,
    key: key,
    type: AppButtonType.elevated,
  );
  final String text;

  final TextStyle? textStyle;
  final Widget? startIcon;
  final Widget? endIcon;
  final Widget Function(double? progress)? loadingWidgetBuilder;
  final ButtonStyle? style;
  final EdgeInsetsGeometry contentPadding;
  final AppButtonType type;
  final void Function()? onPressed;
  final void Function()? onLongPressed;

  final ApiStatus<T>? apiStatus;

  final void Function(FailureEntity failure)? onFailure;
  final void Function(T result)? onSuccess;
  final void Function(double? progress)? onLoading;

  @override
  State<AppButton<T>> createState() => _AppButtonState();
}

class _AppButtonState<T> extends State<AppButton<T>> {
  late ThemeData _themeData;
  final _materialStatesController = MaterialStatesController();
  bool get _isLoading => widget.apiStatus is LoadingApiStatus;

  Size? _widgetSize;
  final _childKey = GlobalKey();

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      _widgetSize = _childKey.currentContext?.size;
    });
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant final AppButton<T> oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      widget.apiStatus?.maybeWhen(
        orElse: () {},
        failure: (final failure) {
          widget.onFailure?.call(failure);
        },
        loading: (final progress) {
          widget.onLoading?.call(progress);
        },
        success: (final result) {
          widget.onSuccess?.call(result);
        },
      );
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(final BuildContext context) {
    _themeData = Theme.of(context);

    return Directionality(
      textDirection: Utils.estimateDirectionOfText(widget.text),
      child: switch (widget.type) {
        AppButtonType.filled => FilledButton(
          onPressed: !_isLoading ? widget.onPressed : null,
          onLongPress: !_isLoading ? widget.onLongPressed : null,
          statesController: _materialStatesController,
          style: widget.style,
          child: _child,
        ),
        AppButtonType.text => TextButton(
          onPressed: !_isLoading ? widget.onPressed : null,
          onLongPress: !_isLoading ? widget.onLongPressed : null,
          style: widget.style,
          statesController: _materialStatesController,
          child: _child,
        ),
        AppButtonType.outlined => OutlinedButton(
          onPressed: !_isLoading ? widget.onPressed : null,
          onLongPress: !_isLoading ? widget.onLongPressed : null,
          style: widget.style,
          statesController: _materialStatesController,
          child: _child,
        ),
        AppButtonType.elevated => ElevatedButton(
          onPressed: !_isLoading ? widget.onPressed : null,
          onLongPress: !_isLoading ? widget.onLongPressed : null,
          statesController: _materialStatesController,
          style: widget.style,
          child: _child,
        ),
      },
    );
  }

  Widget get _child => Padding(
    padding: widget.contentPadding,
    child: Stack(
      key: _childKey,
      alignment: Alignment.center,
      fit: StackFit.passthrough,
      children: [
        Opacity(
          opacity: _isLoading ? 0.7 : 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.startIcon != null) ...[
                widget.startIcon!,
                Utils.horizontalSpacer(AppSizes.points_4),
              ],
              _text(),
              if (widget.endIcon != null) ...[
                Utils.horizontalSpacer(AppSizes.points_4),
                widget.endIcon!,
              ],
            ],
          ),
        ),
        if (_isLoading) _loadingWidget(),
      ],
    ),
  );

  Widget _text() => ValueListenableBuilder<Set<WidgetState>>(
    valueListenable: _materialStatesController,
    builder: (final context, final value, final child) => AppText(
      widget.text,
      style:
          widget.textStyle ??
          widget.style?.textStyle?.resolve(value) ??
          _buttonTextStyle?.resolve(value),
    ),
  );

  WidgetStateProperty<TextStyle?>? get _buttonTextStyle => switch (widget
      .type) {
    AppButtonType.filled => _themeData.filledButtonTheme.style?.textStyle,
    AppButtonType.outlined => _themeData.outlinedButtonTheme.style?.textStyle,
    AppButtonType.text => _themeData.textButtonTheme.style?.textStyle,
    AppButtonType.elevated => _themeData.elevatedButtonTheme.style?.textStyle,
  };

  Widget _loadingWidget() {
    final progress = (widget.apiStatus as LoadingApiStatus).progress;

    return widget.loadingWidgetBuilder?.call(progress) ??
        SizedBox(
          width: _widgetSize?.width ?? AppSizes.points_64,
          height: _widgetSize?.height ?? AppSizes.points_32,
          child: (progress == null)
              ? LinearProgressIndicator(
                  minHeight: (_widgetSize?.height ?? AppSizes.points_32) / 2,
                )
              : Stack(
                  alignment: Alignment.center,
                  fit: StackFit.passthrough,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: AppText(
                        '% ${(progress * 100).toStringAsFixed(0)}',
                        style:
                            widget.textStyle ??
                            widget.style?.textStyle?.resolve(<WidgetState>{
                              WidgetState.selected,
                            }) ??
                            _buttonTextStyle?.resolve(<WidgetState>{
                              WidgetState.selected,
                            }),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 2,
                      ),
                    ),
                  ],
                ),
        );
  }
}

enum AppButtonType { elevated, filled, outlined, text }
