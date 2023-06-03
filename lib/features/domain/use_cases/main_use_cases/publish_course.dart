import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:final_student_dashboard/features/domain/repositories/base_main_repository.dart';

import '../../../../core/error/failure.dart';

class PublishCourseUseCase {
  final BaseMainRepository baseMainRepository;

  PublishCourseUseCase(this.baseMainRepository);

  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>> execute(
      {required Map<String, dynamic> course}) async {
    return await baseMainRepository.publishCourse(course: course);
  }
}
