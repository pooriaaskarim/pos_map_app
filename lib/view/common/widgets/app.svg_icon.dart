import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _svgDir = 'assets/svgs/';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    required this.iconName,
    this.size = 24,
    this.fit = BoxFit.contain,
    this.overlayColor,
    super.key,
  });

  final String iconName;
  final double size;
  final Color? overlayColor;
  final BoxFit fit;
  @override
  Widget build(final BuildContext context) => SvgPicture.asset(
    '$_svgDir$iconName',
    width: size,
    height: size,
    alignment: Alignment.center,
    fit: fit,
    colorFilter: overlayColor == null
        ? null
        : ColorFilter.mode(overlayColor!, BlendMode.srcIn),
  );
}
