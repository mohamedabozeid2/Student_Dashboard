import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/hive/hive_helper.dart';
import '../../../../core/hive/hive_keys.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/strings.dart';
import '../../../data/model/student_model.dart';
import '../../../domain/use_cases/register_use_cases/add_student_to_firestore.dart';
import '../../../domain/use_cases/register_use_cases/student_register.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final StudentRegisterUseCase _studentRegisterUseCase;
  final AddStudentToFireStoreUseCase _addStudentToFireStoreUseCase;

  RegisterCubit(
    this._studentRegisterUseCase,
    this._addStudentToFireStoreUseCase,
  ) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool passwordIsVisible = true;
  bool reTypePasswordIsVisible = true;
  IconData reTypePasswordIcon = Icons.visibility;
  IconData passwordIcon = Icons.visibility;

  void changePasswordVisibility({bool retype = false}) {
    if (!retype) {
      passwordIsVisible = !passwordIsVisible;
      if (passwordIsVisible) {
        passwordIcon = Icons.visibility;
      } else {
        passwordIcon = Icons.visibility_off;
      }
      emit(RegisterPasswordChangeVisibility());
    } else {
      reTypePasswordIsVisible = !reTypePasswordIsVisible;
      if (reTypePasswordIsVisible) {
        reTypePasswordIcon = Icons.visibility;
      } else {
        reTypePasswordIcon = Icons.visibility_off;
      }
      emit(RegisterReTypePasswordChangeVisibility());
    }
  }

  bool getRegisterValidation({
    required String name,
    required String email,
    required String password,
    required String reTypePassword,
  }) {
    if (name == "") {
      Components.showSnackBar(
        title: AppStrings.appName,
        message: AppStrings.nameValidation,

      );
      emit(RegisterValidationErrorState());
      return true;
    } else if (email == "") {
      Components.showSnackBar(
        title: AppStrings.appName,
        message: AppStrings.emailValidation,

      );
      emit(RegisterValidationErrorState());
      return true;
    } else if (password.length <= 6) {
      Components.showSnackBar(
        title: AppStrings.appName,
        message: AppStrings.passwordValidation,

      );
      emit(RegisterValidationErrorState());
      return true;
    } else if (password != reTypePassword) {
      Components.showSnackBar(
        title: AppStrings.appName,
        message: AppStrings.passwordMatch,

      );
      emit(RegisterValidationErrorState());
      return true;
    } else {
      return false;
    }
  }

  void studentRegister({
    required String name,
    required String email,
    required String password,
    required String reTypePassword,
  }) {
    emit(RegisterLoadingState());
    if (getRegisterValidation(
      name: name,
      email: email,
      password: password,
      reTypePassword: reTypePassword,
    )) {
      return;
    }

    _studentRegisterUseCase
        .execute(
      email: email.trim(),
      name: name,
      password: password,
    )
        .then((value) {
      value.fold((l) {
        emit(RegisterErrorState(l.message));
      }, (r) {
        studentCreate(
          name: name,
          email: email,
          studentId: r.user!.uid,
        );
      });
    });
  }

  void studentCreate({
    required String name,
    required String email,
    required String studentId,
  }) {
    StudentModel studentModel = StudentModel(
      email: email,
      name: name,
      id: studentId,
      enrollmentDate: getTodayDate(),
      GPA: 0.0,
      graduationDate: "",
      phone: "",
      profilePicture: "",
    );
    _addStudentToFireStoreUseCase
        .execute(
      name: name,
      email: email.trim(),
      studentId: studentId,
      studentModel: studentModel,
    )
        .then((value) {
      value.fold((l) {
        emit(RegisterErrorState(l.message));
      }, (r) {
        HiveHelper.putInBox(
          box: HiveHelper.studentId,
          key: HiveKeys.studentId.toString(),
          data: studentId,
        );
        Constants.setStudentId(studentId);
        HiveHelper.putInBox(
          box: HiveHelper.loggedIn,
          key: HiveKeys.loggedIn.toString(),
          data: true,
        );
        Constants.setLoggedIn(true);
        HiveHelper.putInStudent(
          student: studentModel,
        );
        Constants.setCurrentStudent(studentModel);

        emit(RegisterSuccessState());
      });
    });
  }

  String getTodayDate() {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(DateTime.now());
  }
}
