import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static Widget verticalSpacer([final double size = AppSizes.points_16]) =>
      SizedBox(height: size);

  static Widget horizontalSpacer([final double size = AppSizes.points_16]) =>
      SizedBox(width: size);

  static TextDirection estimateDirectionOfText(final String text) {
    bool startsWithRtl(final String text) {
      const String ltrChars =
          r'A-Za-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02B8\u0300-\u0590'
          r'\u0800-\u1FFF\u2C00-\uFB1C\uFDFE-\uFE6F\uFEFD-\uFFFF';
      const String rtlChars = r'\u0591-\u07FF\uFB1D-\uFDFD\uFE70-\uFEFC';
      return RegExp('^[^$ltrChars]*[$rtlChars]').hasMatch(text);
    }

    final words = text.split(RegExp(r'\s+'));
    if (startsWithRtl(words.first)) {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  }
}

class AppSizes {
  AppSizes._();

  static const double _baseSize = 8.0;
  static const double points_0 = _baseSize * 0.0;
  static const double points_4 = _baseSize * 0.5;
  static const double points_8 = _baseSize * 1.0;
  static const double points_12 = _baseSize * 1.5;
  static const double points_16 = _baseSize * 2.0;
  static const double points_24 = _baseSize * 3.0;
  static const double points_32 = _baseSize * 4.0;
  static const double points_40 = _baseSize * 5.0;
  static const double points_48 = _baseSize * 6.0;
  static const double points_56 = _baseSize * 7.0;
  static const double points_64 = _baseSize * 8.0;
}

class ResponsiveUtils {
  ResponsiveUtils._();

  static EdgeInsets horizontalPadding(
    final BuildContext context, {
    final bool largerPaddings = false,
  }) {
    final width = MediaQuery.of(context).size.width;
    return EdgeInsets.symmetric(
      horizontal: (width < 480)
          ? 0
          : (width >= 480 && width < 900)
          ? width / 10
          : (width >= 900 && width < 1200)
          ? width / (largerPaddings ? 4 : 8)
          : width / (largerPaddings ? 4 : 8),
    );
  }

  static EdgeInsets verticalPadding(final BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return EdgeInsets.symmetric(vertical: (height < 900) ? 0 : height / 10);
  }

  static Widget responsiveContent({
    required final Widget child,
    required final BuildContext context,
    final bool isScrollable = false,
    final Axis scrollDirection = Axis.vertical,
    final Alignment alignment = Alignment.topCenter,
    final bool largerPaddings = false,
  }) => Padding(
    padding: scrollDirection == Axis.vertical
        ? horizontalPadding(context, largerPaddings: largerPaddings)
        : verticalPadding(context),
    child: Align(
      alignment: alignment,
      child: isScrollable
          ? SingleChildScrollView(
              physics: const PageScrollPhysics(),
              clipBehavior: Clip.hardEdge,
              scrollDirection: scrollDirection,
              child: child,
            )
          : child,
    ),
  );
}

class AppConstants {
  AppConstants._();

  static const String imageAssetsPath = 'assets/images/';
  static const double borderRadius = 5.0;
  static const double largeBorderRadius = 10.0;

  static const Duration tooltipDuration = Duration(milliseconds: 550);
}
