import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickui/quickui.dart';

class Image_ extends StatelessWidget {
  final double? height;
  final double? width;

  /// Asset image name to display a local image from the assets folder.
  /// 
  /// Supported image formats:
  /// • PNG
  /// • JPG / JPEG  
  /// • GIF
  /// • BMP
  /// • WBMP
  /// • WebP (Android only by default; limited support on iOS)
  final String? assetName;

  // Image related
  final String? imageUrl;

  // SVG related
  final String? localSvgAsset;
  final Color? svgColor;
  final Gradient? iconGradient;

  // Other attributes
  final BoxFit boxFit;
  final Widget? placeholder;
  final Alignment alignment;

  const Image_({
    super.key,
    this.assetName,
    this.localSvgAsset,
    this.imageUrl,
    this.height,
    this.width,
    this.svgColor,
    this.iconGradient,
    this.placeholder,
    this.boxFit = BoxFit.contain,
    this.alignment = Alignment.center,
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
    } else if (assetName != null) {
      return _buildAssetImage();
    } else {
      return Container_();
    }
  }

  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: boxFit,
      errorWidget: (context, url, error) => _buildPlaceholder(),
      placeholder: (context, url) => _buildPlaceholder(),
      height: height,
      width: width,
      alignment: alignment,
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
      fit: boxFit,
      color: isMaskingGradient ? Colors.white : svgColor,
      alignment: alignment,
    );
  }

  Widget _buildAssetImage() {
    return Image.asset(
      assetName!,
      height: height,
      width: width,
      fit: boxFit,
      errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      alignment: alignment,
    );
  }

  Widget _buildPlaceholder() {
    return placeholder ??
        Container_(
          color: Colors.white,
        );
  }
}
