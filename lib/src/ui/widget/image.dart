import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Image_ extends StatelessWidget {
  final double? height;
  final double? width;

  // SVG related
  final String? localSvgAsset;
  final Color? svgColor;
  final Gradient? iconGradient;

  const Image_({
    super.key,
    this.localSvgAsset,
    this.height,
    this.width,
    this.svgColor,
    this.iconGradient,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Align(
        child: iconGradient != null
            ? _maskWithGradient(buildSvgIcon(isMaskingGradient: true))
            : buildSvgIcon(),
      ),
    );
  }

  Widget _maskWithGradient(
    Widget child,
  ) =>
      ShaderMask(
        shaderCallback: (bounds) => iconGradient!.createShader(bounds),
        child: child,
      );

  Widget buildSvgIcon({bool isMaskingGradient = false}) {
    return SvgPicture.asset(
      localSvgAsset!,
      height: height,
      width: width,
      fit: BoxFit.contain,
      color: isMaskingGradient ? Colors.white : svgColor,
    );
  }
}
