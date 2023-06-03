import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../tips_screen/tips_screen.dart';

class ExamsTips extends StatelessWidget {
  const ExamsTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.s15),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(AppSize.s15)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.examsTime.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  AppStrings.examsTimeBody,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: AppSize.s10,
                ),
                Text(
                  AppStrings.einsteinQuote,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: AppSize.s15,
                ),
                CustomButton(
                  fun: () {
                    Components.navigateTo(context, TipsScreen());
                  },
                  text: AppStrings.viewExamsTips,
                  backgroundColor: AppColors.mainColor,
                  borderRadius: AppSize.s15,
                  textColor: Colors.white,
                  height: AppSize.s50,
                  fontSize: AppFontSize.s20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
