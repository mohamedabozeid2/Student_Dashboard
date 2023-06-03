import 'package:flutter/material.dart';

import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/components.dart';
import '../../../../data/model/course_model.dart';
import 'course_details_Screen.dart';
import 'couse_item_counter.dart';

class CourseItemBuilder extends StatelessWidget {
  final int index;
  final CourseModel courseModel;

  const CourseItemBuilder({
    Key? key,
    required this.courseModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Components.navigateTo(
            context,
            CourseDetailsScreen(
              index: index,
              courseModel: courseModel,
            ));
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s10),
          child: Row(
            children: [
              CourseItemCounter(index: index + 1),
              SizedBox(
                width: AppSize.s10,
              ),
              Text(
                courseModel.title,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
