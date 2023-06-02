import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../data/model/student_model.dart';
import '../../repositories/base_register_repository.dart';

class AddStudentToFireStoreUseCase {
  final BaseRegisterRepository baseRegisterRepository;

  AddStudentToFireStoreUseCase(this.baseRegisterRepository);

  Future<Either<Failure, void>> execute({
    required String name,
    required String email,
    required String studentId,
    required StudentModel studentModel,
  }) async {
    return await baseRegisterRepository.addStudentToFireStore(
      email: email,
      name: name,
      userId: studentId,
      studentModel: studentModel,
    );
  }
}
