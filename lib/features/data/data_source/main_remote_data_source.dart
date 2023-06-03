import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/error_message_model.dart';

abstract class BaseMainRemoteDataSource {
  Future<QuerySnapshot<Map<String, dynamic>>> getAnnouncements();

  Future<DocumentReference<Map<String, dynamic>>> sendAnnouncement({
    required Map<String, dynamic> announcementModel,
  });

  Future<DocumentReference<Map<String, dynamic>>> sendExam({
    required Map<String, dynamic> examModel,
  });

  Future<QuerySnapshot<Map<String, dynamic>>> getExams();

  Future<DocumentReference<Map<String, dynamic>>> publishCourse({
    required Map<String, dynamic> courseModel,
  });

  Future<QuerySnapshot<Map<String, dynamic>>> getCourses();
}

class MainRemoteDataSource extends BaseMainRemoteDataSource {
  @override
  Future<DocumentReference<Map<String, dynamic>>> sendAnnouncement(
      {required Map<String, dynamic> announcementModel}) async {
    try {
      return await FirebaseFirestore.instance
          .collection('announcements')
          .add(announcementModel);
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(e.code),
      );
    } catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAnnouncements() async {
    try {
      return await FirebaseFirestore.instance.collection('announcements').get();
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(e.code),
      );
    } catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<DocumentReference<Map<String, dynamic>>> sendExam(
      {required Map<String, dynamic> examModel}) async {
    try {
      return await FirebaseFirestore.instance
          .collection('exams')
          .add(examModel);
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(e.code),
      );
    } catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getExams() async {
    try {
      return await FirebaseFirestore.instance.collection('exams').get();
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(e.code),
      );
    } catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getCourses() async {
    try {
      return await FirebaseFirestore.instance.collection('courses').get();
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(e.code),
      );
    } catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<DocumentReference<Map<String, dynamic>>> publishCourse(
      {required Map<String, dynamic> courseModel}) async {
    try {
      return await FirebaseFirestore.instance
          .collection('courses')
          .add(courseModel);
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(e.code),
      );
    } catch (e) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromServer(
          e.toString(),
        ),
      );
    }
  }
}
