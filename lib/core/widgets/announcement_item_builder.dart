import 'package:final_student_dashboard/core/utils/app_colors.dart';
import 'package:final_student_dashboard/features/presentation/screens/announcement_screen/widgets/announcement_details_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_values.dart';
import '../utils/components.dart';
import '../utils/helper.dart';
import 'cached_image.dart';
import '../../features/data/model/announcement_model.dart';

class AnnouncementItemBuilder extends StatelessWidget {
  final AnnouncementModel announcement;
  final bool fromAnnouncementsScreen;

  const AnnouncementItemBuilder({
    Key? key,
    this.fromAnnouncementsScreen = false,
    required this.announcement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (fromAnnouncementsScreen) {
          Components.navigateTo(
              context,
              AnnouncementDetailsScreen(
                announcement: announcement,
              ));
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: Helper.getMaxWidth() * 0.2,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Helper.getMaxHeight() * 0.5),
                  color: Colors.red),
              child: CachedImage(
                image: announcement.announcerPhoto,
                height: Helper.getMaxHeight() * 0.1,
                circularColor: AppColors.secondaryColor,
                width: Helper.getMaxWidth() * 0.2,
              ),
            ),
            SizedBox(
              width: Helper.getMaxWidth() * 0.03,
            ),
            SizedBox(
              width: Helper.getMaxWidth() * 0.62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    announcement.announcer,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: AppSize.s5,
                  ),
                  Text(
                    announcement.announcementBody,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
