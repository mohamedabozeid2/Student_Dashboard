import '../../domain/entities/student.dart';

class StudentModel extends Student {
  StudentModel({
    required super.email,
    required super.name,
    required super.id,
    required super.enrollmentDate,
    required super.GPA,
    required super.graduationDate,
    required super.phone,
    required super.profilePicture,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      email: json['email'],
      name: json['name'],
      id: json['id'],
      enrollmentDate: json['enrollmentDate'],
      GPA: json['GPA'],
      graduationDate: json['graduationDate'],
      phone: json['phone'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "id": id,
      "enrollmentDate": enrollmentDate,
      "GPA": GPA,
      "graduationDate": graduationDate,
      "phone": phone,
      "profilePicture": profilePicture,
    };
  }
}
