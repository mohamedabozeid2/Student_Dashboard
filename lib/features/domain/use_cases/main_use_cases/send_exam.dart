import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:final_student_dashboard/features/domain/repositories/base_main_repository.dart';

import '../../../../core/error/failure.dart';

class SendExamUseCase {
  final BaseMainRepository baseMainRepository;

  SendExamUseCase(this.baseMainRepository);

  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>> execute({
    required Map<String, dynamic> exam,
  }) async {
    return await baseMainRepository.sendExam(exam: exam);
  }
}
