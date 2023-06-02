abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginChangeVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginValidationErrorState extends LoginStates {}

class GetStudentDataLoadingState extends LoginStates {}

class GetStudentDataSuccessState extends LoginStates {}

class GetStudentDataErrorState extends LoginStates {
  final String error;

  GetStudentDataErrorState(this.error);
}
