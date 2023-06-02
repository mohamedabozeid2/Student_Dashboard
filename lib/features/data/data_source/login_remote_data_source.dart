import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/error_message_model.dart';

abstract class BaseLoginRemoteDataSource {
  Future<UserCredential> studentLogin({
    required String email,
    required String password,
  });

  Future<DocumentSnapshot<Map<String,dynamic>>> getStudentData({
    required String studentId,
  });
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  @override
  Future<UserCredential> studentLogin({
    required String email,
    required String password,
  }) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
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
  Future<DocumentSnapshot<Map<String,dynamic>>> getStudentData({required String studentId}) async{
      try {
        return await FirebaseFirestore.instance.collection('students').doc(studentId).get();
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
