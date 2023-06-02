import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/base_login_repository.dart';

class StudentLoginUseCase {
  final BaseLoginRepository baseLoginRepository;

  StudentLoginUseCase(this.baseLoginRepository);

  Future<Either<Failure, UserCredential>> execute({
    required String email,
    required String password,
  }) async {
    return await baseLoginRepository.studentLogin(
      email: email,
      password: password,
    );
  }
}
