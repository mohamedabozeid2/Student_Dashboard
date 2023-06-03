import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/base_main_repository.dart';

class SendAnnouncementUseCase {
  final BaseMainRepository baseMainRepository;

  SendAnnouncementUseCase(this.baseMainRepository);

  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>> execute({
    required Map<String,dynamic> announcement,
  }) async {
    return await baseMainRepository.sendAnnouncement(
      announcement: announcement,
    );
  }
}
