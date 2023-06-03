import 'package:equatable/equatable.dart';

class Exam extends Equatable {
  final int id;
  final String name;
  final String date;
  final String startTime;
  final String duration;
  final String instructions;

  const Exam({
    required this.date,
    required this.duration,
    required this.name,
    required this.id,
    required this.instructions,
    required this.startTime,
  });

  @override
  List<Object?> get props => [
        date,
        duration,
        name,
        id,
        instructions,
        startTime,
      ];
}
