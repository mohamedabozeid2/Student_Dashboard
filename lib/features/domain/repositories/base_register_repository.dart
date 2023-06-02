import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/failure.dart';
import '../../data/model/student_model.dart';

abstract class BaseRegisterRepository {
  Future<Either<Failure, UserCredential>> studentRegister({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, void>> addStudentToFireStore({
    required String email,
    required String name,
    required String userId,
    required StudentModel studentModel,
  });
}
