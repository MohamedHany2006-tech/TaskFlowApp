abstract class LoginState {}

class LoginInitialState extends LoginState {}

// Login States

class InitialLoginState extends LoginState {}

class LoadinLogingState extends LoginState {}

class SuccessLoginState extends LoginState {}

class FailureLoginState extends LoginState {
  final String errorMessage;

  FailureLoginState({
    required this.errorMessage,
  });
}

// Register States

class InitialRegisterState extends LoginState {}

class LoadingRegisterState extends LoginState {}

class SuccessRegisterState extends LoginState {}

class FailureRegisterState extends LoginState {
  final String errorMessage;

  FailureRegisterState({
    required this.errorMessage,
  });
}