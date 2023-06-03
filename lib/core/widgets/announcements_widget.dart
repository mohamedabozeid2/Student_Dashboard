import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/app_values.dart';
import '../utils/constants.dart';
import '../utils/helper.dart';
import '../utils/strings.dart';
import 'divider.dart';
import 'announcement_item_builder.dart';

class AnnouncementsWidget extends StatelessWidget {
  final bool fromAnnouncementScreen;

  const AnnouncementsWidget({
    Key? key,
    this.fromAnnouncementScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fromAnnouncementScreen
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.announcements,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: AppFontSize.s24,
                                  ),
                        ),
                        SizedBox(
                          height: AppSize.s2,
                        ),
                        Text(
                          AppStrings.announcementsTitle,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: AppSize.s10,
                        ),
                      ],
                    ),
              Expanded(
                child: ListView.separated(
                    physics: fromAnnouncementScreen
                        ? const BouncingScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AnnouncementItemBuilder(
                        announcement: Constants.announcements[index],
                        fromAnnouncementsScreen: true,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return MyDivider(color: AppColors.secondaryColor);
                    },
                    itemCount: Constants.announcements.length),
              ),
              SizedBox(
                height: Helper.getMaxHeight() * 0.05,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
