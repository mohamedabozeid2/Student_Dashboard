import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/divider.dart';
import '../../../domain/entities/study_tips.dart';
import 'widgets/tip_item_builder.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Helper.getMaxHeight() * 0.13,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(AppIcons.backIcon),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.tipsTitle,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return TipItemBuilder(studyTip: studyTips[index]);
                },
                separatorBuilder: (context, index) {
                  return MyDivider(color: AppColors.secondaryColor);
                },
                itemCount: studyTips.length),
          ),
          SizedBox(
            height: Helper.getMaxHeight()*0.05,
          )
        ],
      ),
    );
  }
}
