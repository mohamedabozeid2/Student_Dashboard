import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/helper.dart';
import '../../../domain/entities/MenuItemDetails.dart';
import '../announcement_screen/announcement_screen.dart';
import '../courses_screen/courses_screen.dart';
import '../dashboard_screen/dashboard_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../schedule_screen/schedule_screen.dart';
import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MenuItemDetails currentItem = MenuItems.dashboard;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      return ZoomDrawer(
        style: DrawerStyle.defaultStyle,
        controller: Constants.drawerController,
        showShadow: false,
        angle: 0.0,
        borderRadius: AppSize.s25,
        mainScreenTapClose: true,
        menuScreenOverlayColor: Colors.black,
        openCurve: Curves.fastOutSlowIn,
        menuBackgroundColor: AppColors.secondaryColor,
        menuScreenWidth: Helper.getMaxWidth() * 0.5,
        slideWidth: Helper.getMaxWidth() * 0.6,
        menuScreen: Builder(
          builder: (context) => MenuScreen(
            currentItem: currentItem,
            onSelectedItem: (item) {
              currentItem = item;
              ZoomDrawer.of(context)!.close();
              setState(() {});
            },
          ),
        ),
        mainScreen: getScreen(),
      );
    });
  }

  Widget getScreen() {
    if (currentItem == MenuItems.dashboard) {
      return const DashboardScreen();
    } else if (currentItem == MenuItems.announcement) {
      return const AnnouncementScreen();
    } else if (currentItem == MenuItems.courses) {
      return const CoursesScreen();
    } else if (currentItem == MenuItems.profile) {
      return ProfileScreen();
    } else {
      return const ScheduleScreen();
    }
  }
}
