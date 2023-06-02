import 'package:flutter/material.dart';

class Helper {
  static late double _maxHeight;
  static late double _maxWidth;

  static void setMaxHeight(double height) => _maxHeight = height;

  static void setMaxWidth(double width) => _maxWidth = width;

  static double getMaxHeight() => _maxHeight;

  static double getMaxWidth() => _maxWidth;

  static double getPaddingTop({required BuildContext context}) {
    return MediaQuery.of(context).viewPadding.top;
  }

  static double getPaddingBot({required BuildContext context}) {
    return MediaQuery.of(context).viewPadding.bottom;
  }

  static double getPaddingLeft({required BuildContext context}) {
    return MediaQuery.of(context).viewPadding.left;
  }

  static double getPaddingRight({required BuildContext context}) {
    return MediaQuery.of(context).viewPadding.right;
  }
}
