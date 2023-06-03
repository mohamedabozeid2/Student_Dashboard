import 'package:final_student_dashboard/core/utils/app_colors.dart';
import 'package:final_student_dashboard/core/utils/app_fonts.dart';
import 'package:final_student_dashboard/core/utils/app_values.dart';
import 'package:final_student_dashboard/core/widgets/divider.dart';
import 'package:final_student_dashboard/features/domain/entities/study_tips.dart';
import 'package:flutter/material.dart';

class TipItemBuilder extends StatelessWidget {
  final StudyTip studyTip;

  const TipItemBuilder({
    Key? key,
    required this.studyTip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s15),
      child: Container(
        padding: EdgeInsets.all(AppSize.s15),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              studyTip.title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            MyDivider(
              color: Colors.white,
            ),
            Text(
              studyTip.description,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: AppFontSize.s15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
