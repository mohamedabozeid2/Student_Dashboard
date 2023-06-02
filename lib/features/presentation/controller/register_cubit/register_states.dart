abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterPasswordChangeVisibility extends RegisterStates{}
class RegisterReTypePasswordChangeVisibility extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String error;

  RegisterErrorState(this.error);
}
class RegisterValidationErrorState extends RegisterStates{}