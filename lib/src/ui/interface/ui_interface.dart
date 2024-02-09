import 'package:flutter/material.dart';

class BaseStructureInterface {
  late final double? height;
  late final double? width;
}

class BorderInterface {
  // Corner radius
  late final double? topLeftRadius;
  late final double? topRightRadius;
  late final double? bottomLeftRadius;
  late final double? bottomRightRadius;
  late final double? allCornerRadius;
  late final bool shouldMakeBorderOutside;

  // Other attributes
  late final Color? borderColor;
  late final double? borderWidth;
}

class MarginInterface {
  late final double? leftMargin;
  late final double? rightMargin;
  late final double? topMargin;
  late final double? bottomMargin;
  late final double? horizontalMargin;
  late final double? verticalMargin;
  late final double? allMargin;
}

class PaddingInterface {
  late final double? leftPadding;
  late final double? rightPadding;
  late final double? topPadding;
  late final double? bottomPadding;
  late final double? horizontalPadding;
  late final double? verticalPadding;
  late final double? allPadding;
}
