import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/Forms/login/manager/Login_State.dart';
import 'package:to_do_list/core/Utilis/Firebase/Auth.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authServices) : super(LoginInitialState());

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

      emit(SuccessLoginState());
    } catch (e) {
      emit(
        FailureLoginState(
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