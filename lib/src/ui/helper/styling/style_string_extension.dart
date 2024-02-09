import 'package:flutter/material.dart';

extension Style on String {
  /// WEIGHT_SIZE_COLOR
  /// EX: R_20_#1E2732
  /// Weights: R,M,SB,B
  /// Size: 10, 12, 14
  /// Color: #1E2732
  TextStyle ts() {
    List<String> charactersList = split('_');

    return TextStyle(
      fontWeight: _getFontWeight(charactersList[0]),
      fontSize: double.parse(charactersList[1]),
      color: charactersList[2].clr(),
      // fontFamily: AppFonts.openSans,
    );
  }

  Color clr() {
    String colorString = this;
    if (colorString == null || colorString.isEmpty) {
      // Return a default color (e.g., black) if the input is invalid
      return Colors.black;
    }

    // Remove the '#' character from the beginning of the string
    if (colorString[0] == '#') {
      colorString = colorString.substring(1);
    }

    try {
      // Parse the color string as an integer and create a Color object
      return Color(int.parse('0xFF$colorString'));
    } catch (e) {
      // Return a default color (e.g., black) if there's an error
      return Colors.black;
    }
  }
}

FontWeight _getFontWeight(String input) {
  switch (input) {
    case "R":
      return FontWeight.w400;
    case "M":
      return FontWeight.w500;
    case "SB":
      return FontWeight.w600;
    case "B":
      return FontWeight.w700;
    default:
      return FontWeight
          .w400; // Default to 400 if the input doesn't match any case
  }
}
