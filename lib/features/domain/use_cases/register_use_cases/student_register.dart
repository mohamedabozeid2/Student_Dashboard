import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/base_register_repository.dart';

class StudentRegisterUseCase {
  final BaseRegisterRepository baseRegisterRepository;

  StudentRegisterUseCase(
    this.baseRegisterRepository,
  );

  Future<Either<Failure, UserCredential>> execute({
    required String email,
    required String name,
    required String password,
  }) async {
    return await baseRegisterRepository.studentRegister(
      email: email,
      name: name,
      password: password,
    );
  }
}
