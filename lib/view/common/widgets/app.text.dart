import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class AppText extends StatelessWidget {
  factory AppText.labelMedium(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.labelMedium,
    key: key,
  );

  factory AppText(
    final String data, {
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final bool? softWrap,
    final StrutStyle? strutStyle,
    final TextStyle? style,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    key: key,
  );

  factory AppText.rich(
    final TextSpan textSpan, {
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final bool? softWrap,
    final StrutStyle? strutStyle,
    final TextStyle? style,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    textSpan: textSpan,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    key: key,
  );

  factory AppText.headlineLarge(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.headlineLarge,
    key: key,
  );

  factory AppText.headlineMedium(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.headlineMedium,
    key: key,
  );

  factory AppText.headlineSmall(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.headlineSmall,
    key: key,
  );

  factory AppText.displayLarge(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.displayLarge,
    key: key,
  );

  factory AppText.displayMedium(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.displayMedium,
    key: key,
  );

  factory AppText.displaySmall(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.displaySmall,
    key: key,
  );

  factory AppText.titleLarge(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.titleLarge,
    key: key,
  );

  factory AppText.titleMedium(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.titleMedium,
    key: key,
  );

  factory AppText.titleSmall(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.titleSmall,
    key: key,
  );

  factory AppText.bodyLarge(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.bodyLarge,
    key: key,
  );

  factory AppText.bodyMedium(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.bodyMedium,
    key: key,
  );

  factory AppText.bodySmall(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.bodySmall,
    key: key,
  );

  factory AppText.labelLarge(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.labelLarge,
    key: key,
  );

  factory AppText.labelSmall(
    final String data, {
    final TextStyle? mergeWith,
    final bool isRequired = false,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final StrutStyle? strutStyle,
    final bool? softWrap,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
    final Key? key,
  }) => AppText._(
    data: data,
    style: mergeWith,
    isRequired: isRequired,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaler: textScaler,
    textWidthBasis: textWidthBasis,
    type: _AppTextEnum.labelSmall,
    key: key,
  );

  const AppText._({
    this.data,
    this.textSpan,
    this.isRequired = false,
    this.locale,
    this.maxLines,
    this.overflow,
    this.selectionColor,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
    this.type,
    super.key,
  }) : assert(
         textSpan != null || data != null,
         'Provide one of the following: String data or TextSpan textSpan',
       );
  final String? data;
  final TextSpan? textSpan;

  final _AppTextEnum? type;

  final Color? selectionColor;
  final Locale? locale;
  final String? semanticsLabel;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final TextOverflow? overflow;
  final TextScaler? textScaler;
  final TextStyle? style;
  final TextWidthBasis? textWidthBasis;
  final bool isRequired;
  final bool? softWrap;
  final int? maxLines;
  @override
  Widget build(final BuildContext context) {
    final themeData = Theme.of(context);
    final isTextMode = data != null;

    final TextStyle? resolvedTextStyle =
        type?.getTextStyle(context)?.merge(style) ?? style;

    final resolvedDirection =
        textDirection ??
        Utils.estimateDirectionOfText(data ?? textSpan!.toPlainText());

    final textWidget = isTextMode
        ? Text(
            data!,
            locale: locale,
            maxLines: maxLines,
            overflow: overflow,
            softWrap: softWrap,
            strutStyle: strutStyle,
            style: resolvedTextStyle,
            textAlign: textAlign,
            textDirection: resolvedDirection,
            textHeightBehavior: textHeightBehavior,
            textScaler: textScaler,
            textWidthBasis: textWidthBasis,
            selectionColor: selectionColor,
            semanticsLabel: semanticsLabel,
          )
        : Text.rich(
            textSpan!,
            locale: locale,
            maxLines: maxLines,
            overflow: overflow,
            softWrap: softWrap,
            strutStyle: strutStyle,
            style: resolvedTextStyle,
            textAlign: textAlign,
            textDirection: resolvedDirection,
            textHeightBehavior: textHeightBehavior,
            textScaler: textScaler,
            textWidthBasis: textWidthBasis,
            selectionColor: selectionColor,
            semanticsLabel: semanticsLabel,
          );

    return isRequired
        ? Row(
            textDirection: resolvedDirection,
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget,
              const SizedBox(width: 2),
              if (isRequired)
                Text(
                  '*',
                  style: resolvedTextStyle?.copyWith(
                    color: themeData.colorScheme.error,
                  ),
                ),
            ],
          )
        : textWidget;
  }
}

enum _AppTextEnum {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleSmall,
  titleMedium,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall;

  TextStyle? getTextStyle(final BuildContext context) {
    final themeData = Theme.of(context);

    switch (this) {
      case _AppTextEnum.bodyLarge:
        return themeData.textTheme.bodyLarge;
      case _AppTextEnum.bodyMedium:
        return themeData.textTheme.bodyMedium;
      case _AppTextEnum.bodySmall:
        return themeData.textTheme.bodySmall;
      case _AppTextEnum.displayLarge:
        return themeData.textTheme.displayLarge;
      case _AppTextEnum.displayMedium:
        return themeData.textTheme.displayMedium;
      case _AppTextEnum.displaySmall:
        return themeData.textTheme.displaySmall;
      case _AppTextEnum.headlineLarge:
        return themeData.textTheme.headlineLarge;
      case _AppTextEnum.headlineMedium:
        return themeData.textTheme.headlineMedium;
      case _AppTextEnum.headlineSmall:
        return themeData.textTheme.headlineSmall;
      case _AppTextEnum.labelLarge:
        return themeData.textTheme.labelLarge;
      case _AppTextEnum.labelMedium:
        return themeData.textTheme.labelMedium;
      case _AppTextEnum.labelSmall:
        return themeData.textTheme.labelSmall;
      case _AppTextEnum.titleLarge:
        return themeData.textTheme.titleLarge;
      case _AppTextEnum.titleMedium:
        return themeData.textTheme.titleMedium;
      case _AppTextEnum.titleSmall:
        return themeData.textTheme.titleSmall;
    }
  }
}
