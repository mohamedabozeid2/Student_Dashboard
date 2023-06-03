import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:final_student_dashboard/features/domain/repositories/base_main_repository.dart';

import '../../../../core/error/failure.dart';

class GetExamsUseCase{
  final BaseMainRepository baseMainRepository;

  GetExamsUseCase(this.baseMainRepository);

  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> execute() async {
    return await baseMainRepository.getExams();
  }
}