import 'package:flutter/material.dart';

import '../utils/app_icons.dart';
import '../utils/constants.dart';

class DrawerIconButton extends StatelessWidget {
  const DrawerIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("TEST");

        Constants.drawerController.open;
        // Constants.drawerController.toggle?.call();

      },
      child: const Icon(AppIcons.drawerButton),
    );
  }
}
