import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/base_register_repository.dart';
import '../data_source/register_remote_data_source.dart';
import '../model/student_model.dart';

class RegisterRepository extends BaseRegisterRepository {
  final BaseRegisterRemoteDataSource baseRegisterRemoteDataSource;

  RegisterRepository(this.baseRegisterRemoteDataSource);

  @override
  Future<Either<Failure, UserCredential>> studentRegister({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final result = await baseRegisterRemoteDataSource.userRegister(
          email: email, password: password, name: name);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addStudentToFireStore({
    required String email,
    required String name,
    required String userId,
    required StudentModel studentModel,
  }) async {
    try {
      final result = await baseRegisterRemoteDataSource.addUserToFireStore(
        email: email,
        name: name,
        userId: userId,
        studentModel: studentModel,
      );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
