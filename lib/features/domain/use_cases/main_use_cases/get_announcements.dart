import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/base_main_repository.dart';

class GetAnnouncementsUseCase {
  final BaseMainRepository baseMainRepository;

  GetAnnouncementsUseCase(this.baseMainRepository);

  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> execute() async {
    return await baseMainRepository.getAnnouncements();
  }
}
