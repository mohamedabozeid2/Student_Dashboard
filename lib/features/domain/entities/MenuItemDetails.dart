import 'package:flutter/material.dart';

import '../../../core/utils/app_icons.dart';
import '../../../core/utils/strings.dart';

class MenuItemDetails {
  final String title;
  final IconData icon;

  const MenuItemDetails({
    required this.title,
    required this.icon,
  });
}

class MenuItems {
  static const MenuItemDetails dashboard = MenuItemDetails(
    title: AppStrings.dashboard,
    icon: AppIcons.dashboard,
  );

  static const MenuItemDetails courses = MenuItemDetails(
    title: AppStrings.courses,
    icon: AppIcons.courses,
  );

  static const MenuItemDetails schedule = MenuItemDetails(
    title: AppStrings.schedule,
    icon: AppIcons.schedule,
  );

  static const MenuItemDetails announcement = MenuItemDetails(
    title: AppStrings.announcement,
    icon: AppIcons.announcement,
  );
  static const MenuItemDetails profile = MenuItemDetails(
    title: AppStrings.profile,
    icon: AppIcons.profile,
  );

  static const List<MenuItemDetails> menuItemList = <MenuItemDetails>[
    dashboard,
    courses,
    schedule,
    announcement,
    profile,
  ];
}
