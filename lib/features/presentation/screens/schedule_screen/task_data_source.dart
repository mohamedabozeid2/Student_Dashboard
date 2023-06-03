import 'package:syncfusion_flutter_calendar/calendar.dart';

class TaskDataSource extends CalendarDataSource{
  TaskDataSource(appointments){
    this.appointments = appointments;
  }


  getEvent(int index) => appointments![index];

}