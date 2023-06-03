import 'package:flutter/material.dart';

import '../utils/app_icons.dart';
import '../utils/constants.dart';

class DrawerIconButton extends StatelessWidget {
  const DrawerIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Constants.drawerController.toggle?.call();
      },
      child: Container(
        padding: EdgeInsets.only(top: Constants.mainPadding, bottom: Constants.mainPadding, right: Constants.mainPadding),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: const Icon(AppIcons.drawerButton),
      ),
    );
  }
}
