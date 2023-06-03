import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/hive/hive_helper.dart';
import '../../../../core/hive/hive_keys.dart';
import '../../../../core/network/check_connection.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/strings.dart';
import '../../../data/model/student_model.dart';
import '../../../domain/use_cases/login_use_cases/get_student_data_use_case.dart';
import '../../../domain/use_cases/login_use_cases/student_login.dart';
import '../../screens/no_internet_screen/no_internet_screen.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final StudentLoginUseCase _studentLoginUseCase;
  final GetStudentDataUseCase _getStudentDataUseCase;

  LoginCubit(
    this._studentLoginUseCase,
    this._getStudentDataUseCase,
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
      );
      emit(LoginValidationErrorState());
      return true;
    } else if (password.length <= 6) {
      Components.showSnackBar(
        title: AppStrings.appName,
        message: AppStrings.passwordValidation,
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
    CheckConnection.checkConnection().then((value) {
      Constants.setInternetConnection(value);
      if (value) {
        _studentLoginUseCase
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
            getStudentData(studentId: r.user!.uid, context: context);
          });
        });
      } else {
        Components.navigateAndFinish(
            context: context, widget: const NoInternetScreen(fromLogin: true));
      }
    });
  }

  void getStudentData({
    required String studentId,
    required BuildContext context,
    bool fromLogin = true,
  }) {
    if (!fromLogin) {
      emit(GetStudentDataLoadingState());
    }
    CheckConnection.checkConnection().then((value) {
      Constants.setInternetConnection(value);
      if (value) {
        _getStudentDataUseCase
            .execute(
          studentId: studentId,
        )
            .then((value) {
          value.fold((l) {
            emit(GetStudentDataErrorState(l.message));
          }, (r) {
            Constants.setCurrentStudent(StudentModel.fromJson(r.data()!));
            HiveHelper.putInStudent(student: Constants.getCurrentStudent()!);

            emit(LoginSuccessState());
          });
        });
      } else {
        Components.navigateAndFinish(
            context: context, widget: const NoInternetScreen(fromLogin: true));
      }
    });
  }
}
