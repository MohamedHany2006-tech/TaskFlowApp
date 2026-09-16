abstract class AuthState {}

class AuthInitialState extends AuthState {}

// Login States

class InitialAuthState extends AuthState {}

class LoadinLogingState extends AuthState {}

class SuccessAuthState extends AuthState {}

class FailureAuthState extends AuthState {
  final String errorMessage;

  FailureAuthState({
    required this.errorMessage,
  });
}

// Register States

class InitialRegisterState extends AuthState {}

class LoadingRegisterState extends AuthState {}

class SuccessRegisterState extends AuthState {}

class FailureRegisterState extends AuthState {
  final String errorMessage;

  FailureRegisterState({
    required this.errorMessage,
  });
}