import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/base_login_repository.dart';
import '../data_source/login_remote_data_source.dart';

class LoginRepository extends BaseLoginRepository {
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepository(this.baseLoginRemoteDataSource);

  @override
  Future<Either<Failure, UserCredential>> studentLogin({
    required String email,
    required String password,
  }) async {
    try {
      final result = await baseLoginRemoteDataSource.studentLogin(
        email: email,
        password: password,
      );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DocumentSnapshot<Map<String, dynamic>>>>
      getStudentData({
    required String studentId,
  }) async {
    try {
      final result =
          await baseLoginRemoteDataSource.getStudentData(studentId: studentId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
