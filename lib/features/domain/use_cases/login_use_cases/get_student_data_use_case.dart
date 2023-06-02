import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/base_login_repository.dart';

class GetStudentDataUseCase {
  final BaseLoginRepository baseLoginRepository;

  GetStudentDataUseCase(this.baseLoginRepository);

  Future<Either<Failure, DocumentSnapshot<Map<String,dynamic>>>> execute({
    required String studentId,
  }) async {
    return await baseLoginRepository.getStudentData(
      studentId: studentId,
    );
  }
}
