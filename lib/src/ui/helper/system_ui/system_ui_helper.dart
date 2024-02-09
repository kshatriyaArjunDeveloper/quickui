import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void changeSystemBars({
  Color? statusBarBackgroundColor = Colors.transparent,
  bool isStatusBarIconDark = false,
  Color? navigationBarBackgroundColor = Colors.transparent,
  bool isNavigationBarIconDark = false,
}) {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: !isStatusBarIconDark ? Brightness.dark : Brightness
          .light,
      statusBarColor: statusBarBackgroundColor,
      statusBarIconBrightness:
      isStatusBarIconDark ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: navigationBarBackgroundColor,
      systemNavigationBarIconBrightness:
      isNavigationBarIconDark ? Brightness.dark : Brightness.light,
    ),
  );
}