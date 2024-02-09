import 'package:flutter/material.dart';

extension ClickExtension on Widget {
  /// Adds on click with splash effect.
  Widget onClickSplash(void Function() onClickFunction) {
    return InkWell(
      onTap: onClickFunction,
      child: this,
    );
  }

  /// Adds on click without splash effect.
  Widget onClick(void Function() onClickFunction) {
    return GestureDetector(
      onTap: onClickFunction,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }
}
