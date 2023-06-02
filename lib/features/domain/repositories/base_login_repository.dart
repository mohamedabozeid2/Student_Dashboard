import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/failure.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, UserCredential>> studentLogin({
    required String email,
    required String password,
  });

  Future<Either<Failure, DocumentSnapshot<Map<String,dynamic>>>> getStudentData({
    required String studentId,
  });
}
