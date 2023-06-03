import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BaseMainRepository {
  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>>
      getAnnouncements();

  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>>
      sendAnnouncement({
    required Map<String, dynamic> announcement,
  });

  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>> sendExam({
    required Map<String, dynamic> exam,
  });

  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> getExams();

  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>>
      publishCourse({
    required Map<String, dynamic> course,
  });

  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> getCourse();
}
