import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/divider.dart';
import '../../../../data/model/course_model.dart';
import 'couse_item_counter.dart';

class CourseDetailsScreen extends StatelessWidget {
  final int index;
  final CourseModel courseModel;

  const CourseDetailsScreen({
    Key? key,
    required this.courseModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Helper.getMaxHeight() * 0.13,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
              right: AppSize.s10,
              bottom: AppSize.s10,
            ),
            child: const Icon(AppIcons.backIcon),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(Constants.mainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CourseItemCounter(index: index+1),
                  SizedBox(
                    width: AppSize.s10,
                  ),
                  Text(courseModel.title)
                ],
              ),
              MyDivider(color: AppColors.secondaryColor),
              Container(
                padding: EdgeInsets.all(AppSize.s10),
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(AppSize.s15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    courseDetailElement(
                        context: context, text: "ID: ${courseModel.id}"),
                    courseDetailElement(
                        context: context,
                        text: "Description: ${courseModel.description}"),
                    courseDetailElement(
                        context: context,
                        text: "Instructor: ${courseModel.instructor}"),
                    courseDetailElement(
                        context: context,
                        text: "Credits: ${courseModel.credits}"),
                    courseDetailElement(
                        context: context,
                        text: "Prerequisites: ${courseModel.prerequisites}"),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.s15,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  fun: () {},
                  textColor: Colors.white,
                  borderRadius: AppSize.s15,
                  backgroundColor: AppColors.mainColor,
                  text: AppStrings.enroll,
                  height: AppSize.s50,
                  fontSize: AppFontSize.s15,
                  width: Helper.getMaxWidth() * 0.2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget courseDetailElement({
    required String text,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.s10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
