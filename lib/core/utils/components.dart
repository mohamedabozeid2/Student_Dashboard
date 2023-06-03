import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/drawer_icon_button.dart';
import 'app_colors.dart';
import 'constants.dart';
import 'helper.dart';

class Components {
  static String getOS() {
    return Platform.operatingSystem;
  }

  static PreferredSizeWidget defaultAppBar({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      toolbarHeight: Helper.getMaxHeight() * 0.13,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.mainPadding),
        child: const DrawerIconButton(),
      ),
    );
  }

  static showSnackBar({
    required String title,
    required String message,
    int durationWithMilliSeconds = 2000,
  }) {
    Get.snackbar(title, message,
        backgroundColor: AppColors.secondaryColor,
        colorText: Colors.white,
        animationDuration: const Duration(
          milliseconds: 500,
        ),
        duration: Duration(milliseconds: durationWithMilliSeconds));
  }

  static void changePasswordVisibility() {}

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
