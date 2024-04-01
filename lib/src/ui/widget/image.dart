import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickui/quickui.dart';

class Image_ extends StatelessWidget {
  final double? height;
  final double? width;

  // Image related
  final String? imageUrl;

  // SVG related
  final String? localSvgAsset;
  final Color? svgColor;
  final Gradient? iconGradient;

  const Image_({
    super.key,
    this.localSvgAsset,
    this.imageUrl,
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
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    if (imageUrl != null) {
      return _buildNetworkImage();
    } else if (localSvgAsset != null) {
      return _buildSvgImage();
    } else {
      return Container_();
    }
  }

  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: height,
      width: width,
    );
  }

  Widget _buildSvgImage() {
    return Align(
      child: iconGradient != null
          ? _maskWithGradient(buildSvgIcon(isMaskingGradient: true))
          : buildSvgIcon(),
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
