import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/strings.dart';
import 'task_data_source.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.defaultAppBar(
          context: context, title: "Schedule and Reminders"),
      body: SfCalendar(
        dataSource: TaskDataSource(Constants.scheduleTasks),
        onTap: (value) {
          Components.showSnackBar(
            title: AppStrings.appName,
            message: "You have ${value.appointments?.length} tasks",
          );
          debugPrint("${value.date}");
        },
        view: CalendarView.month,
        initialSelectedDate: DateTime.now(),
      ),
    );
  }
}
