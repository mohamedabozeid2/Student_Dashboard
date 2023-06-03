import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/error_message_model.dart';
import '../model/student_model.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<UserCredential> userRegister({
    required String email,
    required String password,
    required String name,
  });

  Future<void> addUserToFireStore({
    required String email,
    required String name,
    required String userId,
    required StudentModel studentModel,
  });
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<UserCredential> userRegister({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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
  Future<void> addUserToFireStore({
    required String email,
    required String name,
    required String userId,
    required StudentModel studentModel,
  }) async {
    try {
      return await FirebaseFirestore.instance
          .collection('students')
          .doc(userId)
          .set(studentModel.toJson());
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
