import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/hive/hive_helper.dart';
import '../../../../core/hive/hive_keys.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../domain/entities/student.dart';
import '../../screens/login_screen/login_screen.dart';
import 'main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  Future<void> loadUserData() async {
    emit(MainLoadUserLoadingData());
    Student? student;
    student = await HiveHelper.getStudent();
    if (student == null) {
      emit(MainLoadUserErrorData());
      return;
    }
    Constants.setCurrentStudent(student);
    emit(MainLoadUserSuccessData());
  }

  void signOut({
    required BuildContext context,
  }) {
    HiveHelper.removeStudent();
    Components.navigateAndFinish(context: context, widget: LoginScreen());
    Constants.setCurrentStudent(null);
    HiveHelper.putInBox(
      box: HiveHelper.loggedIn,
      key: HiveKeys.loggedIn.toString(),
      data: false,
    );
    Constants.setLoggedIn(false);
    emit(MainSignOutState());
  }
}
