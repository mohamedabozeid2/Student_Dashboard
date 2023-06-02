import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Components {

  static String getOS() {
    return Platform.operatingSystem;
  }

  static showSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
    int durationWithMilliSeconds = 2000,
    required Color textColor,
  }) {
    Get.snackbar(title, message,
        backgroundColor: backgroundColor,
        colorText: textColor,
        animationDuration: const Duration(
          milliseconds: 500,
        ),
        duration: Duration(milliseconds: durationWithMilliSeconds));
  }

  static void changePasswordVisibility(){

  }

  static navigateAndFinish({required context, required widget}) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  static navigateTo(context, widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

}
