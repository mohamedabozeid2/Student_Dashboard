import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/cached_image.dart';
import '../../../../core/widgets/divider.dart';
import 'widgets/course_item_builder.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Components.defaultAppBar(
          context: context,
          title: AppStrings.courseSceenTitle,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  CachedImage(
                    image:
                        "https://img.freepik.com/free-photo/young-happy-amazed-student-glasses-sits-by-table-working-with-laptop-looks-camera-wants-draw-you-attention-copispee-his-head-isolated-pink-background_295783-3881.jpg?w=740&t=st=1685800774~exp=1685801374~hmac=3f8b61e340712d9cfc28a38cb586241ceafb4e19bdb19820bd47997bf1a934c0",
                    height: Helper.getMaxHeight() * 0.4,
                    width: Helper.getMaxWidth(),
                    circularColor: AppColors.secondaryColor,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppSize.s10),
                    child: Container(
                      padding:EdgeInsets.all(AppSize.s7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s15),
                        color: AppColors.secondaryColor,
                      ),
                      child: Text(
                        AppStrings.inspiration,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s10,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    index %= Constants.courses.length;
                    return CourseItemBuilder(
                      courseModel: Constants.courses[index],
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return MyDivider(color: AppColors.secondaryColor);
                  },
                  itemCount: Constants.courses.length * 4),
              SizedBox(
                height: Helper.getMaxHeight() * 0.05,
              ),
            ],
          ),
        ));
  }
}
