import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../domain/entities/MenuItemDetails.dart';
import '../../controller/main_cubit/main_cubit.dart';

class MenuScreen extends StatelessWidget {
  final MenuItemDetails currentItem;
  final ValueChanged<MenuItemDetails> onSelectedItem;

  const MenuScreen({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Spacer(),
          // const AppLogo(fromDrawerScreen: true),
          Container(
            padding: EdgeInsets.all(AppSize.s15),
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(AppSize.s15)
            ),
            child: Text(
              AppStrings.appName,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                  color: Colors.white
              ),

            ),
          ),
          SizedBox(
            height: AppSize.s30,
          ),
          ...MenuItems.menuItemList.map((e) => buildMenuItem(e, context)),
          SizedBox(
            height: AppSize.s10,
          ),
          CustomButton(
            fun: () {
              MainCubit.get(context).signOut(
                context: context,
              );
            },
            text: AppStrings.signOut,
            backgroundColor: Colors.white,
            textColor: AppColors.mainColor,
            height: AppSize.s50,
            fontSize: AppFontSize.s20,
            borderRadius: 0,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildMenuItem(MenuItemDetails item,
      BuildContext context,) {
    return ListTile(
      selectedTileColor: AppColors.mainColor,
      selected: currentItem == item,
      minLeadingWidth: AppSize.s20,
      leading: Icon(
        item.icon,
        color: Colors.white,
        size: AppFontSize.s24,
      ),
      title: Text(
        item.title,
        overflow: TextOverflow.ellipsis,
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium!
            .copyWith(
          color: Colors.white,
        ),
      ),
      onTap: () {
        onSelectedItem(item);
      },
    );
  }
}
