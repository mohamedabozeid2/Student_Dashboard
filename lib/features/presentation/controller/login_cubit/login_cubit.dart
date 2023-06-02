import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/hive/hive_helper.dart';
import '../../../../core/hive/hive_keys.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/strings.dart';
import '../../../data/model/student_model.dart';
import '../../../domain/use_cases/login_use_cases/get_student_data_use_case.dart';
import '../../../domain/use_cases/login_use_cases/student_login.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final StudentLoginUseCase studentLoginUseCase;
  final GetStudentDataUseCase getStudentDataUseCase;

  LoginCubit(
    this.studentLoginUseCase,
    this.getStudentDataUseCase,
  ) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
  IconData icon = Icons.visibility;

  void changeVisibility() {
    isVisible = !isVisible;
    if (isVisible) {
      icon = Icons.visibility;
    } else {
      icon = Icons.visibility_off;
    }
    emit(LoginChangeVisibilityState());
  }

  bool getLoginValidation({
    required String email,
    required String password,
  }) {
    if (email == "") {
      Components.showSnackBar(
        title: AppStrings.appName,
        message: AppStrings.emailValidation,
        backgroundColor: AppColors.mainColor,
        textColor: Colors.white,
      );
      emit(LoginValidationErrorState());
      return true;
    } else if (password.length <= 6) {
      Components.showSnackBar(
        title: AppStrings.appName,
        message: AppStrings.passwordValidation,
        backgroundColor: AppColors.mainColor,
        textColor: Colors.white,
      );
      emit(LoginValidationErrorState());
      return true;
    } else {
      return false;
    }
  }

  void studentLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    if (getLoginValidation(
      email: email,
      password: password,
    )) {
      return;
    }
    studentLoginUseCase
        .execute(email: email.trim(), password: password)
        .then((value) {
      value.fold((l) {
        emit(LoginErrorState(l.message));
      }, (r) {
        HiveHelper.putInBox(
          box: HiveHelper.studentId,
          key: HiveKeys.studentId.toString(),
          data: r.user!.uid,
        );
        Constants.setStudentId(r.user!.uid);
        HiveHelper.putInBox(
          box: HiveHelper.loggedIn,
          key: HiveKeys.loggedIn.toString(),
          data: true,
        );
        Constants.setLoggedIn(true);
        getStudentData(studentId: r.user!.uid);
        emit(LoginSuccessState());
      });
    });
  }

  void getStudentData({
    required String studentId,
    bool fromLogin = true,
  }) {
    if (!fromLogin) {
      emit(GetStudentDataLoadingState());
    }
    getStudentDataUseCase
        .execute(
      studentId: studentId,
    )
        .then((value) {
      value.fold((l) {
        emit(GetStudentDataErrorState(l.message));
      }, (r) {
        Constants.setCurrentStudent(StudentModel.fromJson(r.data()!));
        HiveHelper.putInStudent(student: Constants.getCurrentStudent()!);

        if (!fromLogin) {
          emit(GetStudentDataSuccessState());
        }
      });
    });
  }
}
