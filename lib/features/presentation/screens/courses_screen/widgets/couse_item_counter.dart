import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_values.dart';

class CourseItemCounter extends StatelessWidget {
  final int index;

  const CourseItemCounter({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.s10),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppColors.secondaryColor),
      child: Text(
        index.toString(),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
