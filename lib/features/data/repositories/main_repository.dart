import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/base_main_repository.dart';
import '../data_source/main_remote_data_source.dart';

class MainRepository extends BaseMainRepository {
  final BaseMainRemoteDataSource baseMainRemoteDataSource;

  MainRepository(this.baseMainRemoteDataSource);

  @override
  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>>
      sendAnnouncement({required Map<String, dynamic> announcement}) async {
    try {
      final result = await baseMainRemoteDataSource.sendAnnouncement(
        announcementModel: announcement,
      );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>>
      getAnnouncements() async {
    try {
      final result = await baseMainRemoteDataSource.getAnnouncements();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>> sendExam(
      {required Map<String, dynamic> exam}) async {
    try {
      final result = await baseMainRemoteDataSource.sendExam(examModel: exam);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>>
      getExams() async {
    try {
      final result = await baseMainRemoteDataSource.getExams();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>>
      getCourse() async {
    try {
      final result = await baseMainRemoteDataSource.getCourses();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>>
      publishCourse({required Map<String, dynamic> course}) async {
    try {
      final result =
          await baseMainRemoteDataSource.publishCourse(courseModel: course);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
