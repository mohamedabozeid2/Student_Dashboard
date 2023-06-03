import 'package:final_student_dashboard/features/domain/entities/exams.dart';

class ExamModel extends Exam {
  const ExamModel({
    required super.date,
    required super.duration,
    required super.name,
    required super.id,
    required super.instructions,
    required super.startTime,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      date: json['date'],
      duration: json['duration'],
      name: json['name'],
      id: json['id'],
      instructions: json['instructions'],
      startTime: json['startTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "duration": duration,
      "name": name,
      "id": id,
      "instructions": instructions,
      "startTime": startTime,
    };
  }
}
