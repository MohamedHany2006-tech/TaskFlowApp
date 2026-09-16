import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/Forms/Authontication/manager/Auth_State.dart';
import 'package:to_do_list/core/Utilis/Firebase/Auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authServices) : super(AuthInitialState());

  final AuthServices authServices;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoadinLogingState());

    try {
      await authServices.login(
        email: email,
        password: password,
      );

      emit(SuccessAuthState());
    } catch (e) {
      emit(
        FailureAuthState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    emit(LoadingRegisterState());

    try {
      await authServices.createAccount(
        email: email,
        password: password,
      );

      emit(SuccessRegisterState());
    } catch (e) {
      emit(
        FailureRegisterState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}