import 'package:flutter/material.dart';

import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/announcements_widget.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Components.defaultAppBar(
          context: context,
          title: AppStrings.whatsHappeningNow,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.mainPadding),
          child: const AnnouncementsWidget(fromAnnouncementScreen: true),
        ));
  }
}
