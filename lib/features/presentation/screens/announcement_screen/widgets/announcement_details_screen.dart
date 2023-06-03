import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/divider.dart';
import '../../../../../core/widgets/profile_image_widget.dart';
import '../../../../data/model/announcement_model.dart';

class AnnouncementDetailsScreen extends StatelessWidget {
  final AnnouncementModel announcement;

  const AnnouncementDetailsScreen({
    Key? key,
    required this.announcement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: Helper.getMaxHeight() * 0.13,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(AppIcons.backIcon),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Constants.mainPadding,
              vertical: Helper.getMaxHeight() * 0.13),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileImageWidget(photo: announcement.announcerPhoto),
                MyDivider(color: Colors.black),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Author: ${announcement.announcer}",
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "ID: ${announcement.id}",
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Subject: ${announcement.subject}",
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Date: ${announcement.date}",
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Important: ${announcement.isImportant ? "Yes" : "NO"}",
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                Container(
                  padding: EdgeInsets.all(Constants.mainPadding),
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(AppSize.s15)),
                  child: Text(
                    announcement.announcementBody,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
