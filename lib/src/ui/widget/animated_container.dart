import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:quickui/src/ui/interface/ui_interface.dart';

class AnimatedContainer_ extends StatelessWidget
    implements
        BorderInterface,
        PaddingInterface,
        MarginInterface,
        BaseStructureInterface {
  AnimatedContainer_({
    Key? key,
    //Styling
    this.gradient,
    this.backgroundImageAssetName,
    this.backgroundImageFit = BoxFit.cover,
    this.backgroundImageAlignment = Alignment.center,
    // Margin
    this.leftMargin,
    this.rightMargin,
    this.topMargin,
    this.bottomMargin,
    this.verticalMargin,
    this.horizontalMargin,
    this.allMargin,
    // Padding
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.verticalPadding,
    this.horizontalPadding,
    this.allPadding,
    // Border
    this.shouldMakeBorderOutside = false,
    this.borderGradient,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.topLeftRadius,
    this.topRightRadius,
    this.allCornerRadius,
    this.boxShadowList,
    this.borderColor,
    this.borderWidth,
    // Basic
    this.shouldMakeCircle = false,
    this.height,
    this.width,
    this.color,
    this.child,
    // Animation
    this.duration = Durations.short3,
  }) : super(key: key);

  // Margin

  @override
  late final double? topMargin;
  @override
  late final double? bottomMargin;
  @override
  late final double? leftMargin;
  @override
  late final double? rightMargin;
  @override
  late final double? verticalMargin;
  @override
  late final double? horizontalMargin;
  @override
  late final double? allMargin;

  // Padding

  @override
  late final double? topPadding;
  @override
  late final double? bottomPadding;
  @override
  late final double? leftPadding;
  @override
  late final double? rightPadding;
  @override
  late final double? verticalPadding;
  @override
  late final double? horizontalPadding;
  @override
  late final double? allPadding;

  // Basic

  @override
  late final double? height;
  @override
  late final double? width;

  // CUSTOM

  // Styling
  final Gradient? gradient;
  final String? backgroundImageAssetName;
  final BoxFit backgroundImageFit;
  final Alignment backgroundImageAlignment;

  // Border
  final Gradient? borderGradient;
  final List<BoxShadow>? boxShadowList;
  final bool shouldMakeCircle;
  final Color? color;
  final Widget? child;
  @override
  late final double? allCornerRadius;
  @override
  late double? bottomLeftRadius;
  @override
  late double? bottomRightRadius;
  @override
  late double? topLeftRadius;
  @override
  late double? topRightRadius;
  @override
  late final Color? borderColor;
  @override
  late final double? borderWidth;
  @override
  bool shouldMakeBorderOutside;

  // Animation
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      height: shouldMakeCircle ? _getBiggerDimension() : height,
      width: shouldMakeCircle ? _getBiggerDimension() : width,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.only(
        left: leftPadding ?? horizontalPadding ?? allPadding ?? 0,
        right: rightPadding ?? horizontalPadding ?? allPadding ?? 0,
        top: topPadding ?? verticalPadding ?? allPadding ?? 0,
        bottom: bottomPadding ?? verticalPadding ?? allPadding ?? 0,
      ),
      margin: EdgeInsets.only(
        left: leftMargin ?? horizontalMargin ?? allMargin ?? 0,
        right: rightMargin ?? horizontalMargin ?? allMargin ?? 0,
        top: topMargin ?? verticalMargin ?? allMargin ?? 0,
        bottom: bottomMargin ?? verticalMargin ?? allMargin ?? 0,
      ),
      decoration: BoxDecoration(
        shape: shouldMakeCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: shouldMakeCircle
            ? null
            : BorderRadius.only(
                topLeft: Radius.circular(topLeftRadius ?? allCornerRadius ?? 0),
                topRight:
                    Radius.circular(topRightRadius ?? allCornerRadius ?? 0),
                bottomLeft:
                    Radius.circular(bottomLeftRadius ?? allCornerRadius ?? 0),
                bottomRight:
                    Radius.circular(bottomRightRadius ?? allCornerRadius ?? 0),
              ),
        border: _buildBorder(),
        color: color,
        gradient: gradient,
        boxShadow: boxShadowList,
        image: backgroundImageAssetName != null
            ? DecorationImage(
                image: AssetImage(backgroundImageAssetName!),
                fit: backgroundImageFit,
                alignment: backgroundImageAlignment,
              )
            : null,
      ),
      child: child,
    );
  }

  BoxBorder _buildBorder() {
    if (borderGradient != null) {
      return GradientBoxBorder(
        gradient: borderGradient!,
        width: borderWidth ?? 1,
      );
    } else {
      return Border.all(
        color: borderColor ?? Colors.transparent,
        width: borderWidth ?? 0,
        strokeAlign: shouldMakeBorderOutside
            ? BorderSide.strokeAlignOutside
            : BorderSide.strokeAlignInside,
      );
    }
  }

  _getBiggerDimension() {
    if (height != null && width != null) {
      return height! > width! ? height : width;
    } else if (height != null) {
      return height;
    } else if (width != null) {
      return width;
    } else {
      return null;
    }
  }
}
