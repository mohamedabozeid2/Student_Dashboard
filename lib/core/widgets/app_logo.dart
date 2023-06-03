import 'package:flutter/material.dart';

import '../utils/app_values.dart';
import '../utils/assets_manager.dart';
import '../utils/helper.dart';
import '../utils/strings.dart';


class AppLogo extends StatelessWidget {
  final bool fromDrawerScreen;

  const AppLogo({Key? key, this.fromDrawerScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        fromDrawerScreen ? Container() : Image.asset(
          width: Helper.getMaxWidth() * 0.3,
          fit: BoxFit.cover,
          AssetManager.appLogo,
        ),
        SizedBox(
          width: AppSize.s10,
        ),
        Text(
          AppStrings.appName,
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(
              color: fromDrawerScreen ? Colors.white : Colors.black
          ),

        )
      ],
    );
  }
}
