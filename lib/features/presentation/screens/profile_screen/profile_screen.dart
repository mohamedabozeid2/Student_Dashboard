import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/divider.dart';
import '../../../../core/widgets/profile_image_widget.dart';
import '../../../domain/entities/student.dart';

class ProfileScreen extends StatelessWidget {
  final Student currentStudent = Constants.getCurrentStudent()!;

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.defaultAppBar(
        context: context,
        title: AppStrings.profileTitle,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Constants.mainPadding),
          child: Column(
            children: [
              ProfileImageWidget(
                photo: Constants.getCurrentStudent()!.profilePicture != ""
                    ? Constants.getCurrentStudent()!.profilePicture
                    : "https://img.freepik.com/free-photo/indoor-portrait-young-blonde-man-posing-beige-background-smiles-broadly-points-with-finger-his-biceps_295783-16877.jpg?w=740&t=st=1685790385~exp=1685790985~hmac=51ec741a8dfd35cbff1adba0685e6b16a67b8859111b72468928f948eff73471",
              ),
              Text(
                currentStudent.name.capitalizeFirst!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              MyDivider(color: AppColors.secondaryColor),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  profileElement(
                      element: "Gpa: ${currentStudent.GPA}", context: context),
                  profileElement(
                      element:
                          "Enrollment Date: ${currentStudent.enrollmentDate}",
                      context: context),
                  profileElement(
                      element:
                          "Graduation Date: ${currentStudent.graduationDate.isEmpty ? "Unknown" : currentStudent.graduationDate}",
                      context: context),
                  profileElement(
                      element:
                          "Phone: ${currentStudent.phone.isEmpty ? "Unknown" : currentStudent.phone}",
                      context: context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profileElement({
    required String element,
    required BuildContext context,
  }) {
    return Text(
      element,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
