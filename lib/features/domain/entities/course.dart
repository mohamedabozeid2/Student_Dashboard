import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final int id;
  final String title;
  final String description;
  final String instructor;
  final int credits;
  final String prerequisites;

  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.credits,
    required this.instructor,
    required this.prerequisites,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        credits,
        instructor,
        prerequisites,
      ];
}
