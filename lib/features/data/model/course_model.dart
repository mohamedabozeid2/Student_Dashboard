import '../../domain/entities/course.dart';

class CourseModel extends Course {
  const CourseModel({
    required super.id,
    required super.title,
    required super.description,
    required super.credits,
    required super.instructor,
    required super.prerequisites,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      credits: json['credits'],
      instructor: json['instructor'],
      prerequisites: json['prerequisites'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "credits": credits,
      "instructor": instructor,
      "prerequisites": prerequisites,
    };
  }
}
