import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';


part 'student.g.dart';
@HiveType(typeId: 0)
class Student extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String enrollmentDate;
  @HiveField(5)
  final String profilePicture;
  @HiveField(6)
  final String graduationDate;
  @HiveField(7)
  final double GPA;

  Student({
    required this.email,
    required this.name,
    required this.id,
    required this.enrollmentDate,
    required this.GPA,
    required this.graduationDate,
    required this.phone,
    required this.profilePicture,
  });

  @override
  List<Object?> get props => [
        email,
        name,
        id,
        enrollmentDate,
        GPA,
        graduationDate,
        phone,
        profilePicture,
      ];
}
