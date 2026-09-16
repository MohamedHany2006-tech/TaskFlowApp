import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/core/Forms/login/manager/Login_Cubit.dart';
import 'package:to_do_list/core/Forms/login/manager/Login_State.dart';
import 'package:to_do_list/core/Share/widgets/cutome_main_btn.dart';
import 'package:to_do_list/core/Share/widgets/text_input_field.dart';
import 'package:to_do_list/core/Utilis/unints.dart';
import 'package:to_do_list/core/navigation/Routes.dart';
import 'package:to_do_list/core/style/TextStyleManager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TapGestureRecognizer _signUpRecognizer;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _signUpRecognizer = TapGestureRecognizer()
      ..onTap = () {
        context.go(Routes.kRegister);
      };
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _signUpRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            context.pushReplacement(Routes.kHome);
          } else if (state is FailureLoginState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Units.getWidth(context: context, value: 24),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: Units.getHeight(context: context, value: 40),
                    ),

                    Center(
                      child: Text(
                        'Welcome Back!',
                        style: TextStyleManager.textStyleNeutralPrimarySB24(
                          context,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 8),
                    ),

                    Center(
                      child: Text(
                        'Your work faster and structured with Taskflow',
                        style: TextStyleManager.textStyleNeutralSecondaryR14(
                          context,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 48),
                    ),

                    TextInputField(
                      controller: _emailController,
                      title: 'Email Address',
                      hintText: 'name@example.com',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        if (!value.contains('@')) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 24),
                    ),

                    TextInputField(
                      controller: _passwordController,
                      title: 'Password',
                      hintText: '••••••••••••••••',
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),

                    const Spacer(),

                    state is LoadinLogingState
                        ? const Center(child: CircularProgressIndicator())
                        : CutomeMainBtn(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginCubit>().login(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    );
                              }
                            },
                            btnTitle: 'Continue',
                          ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 16),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyleManager.textStyleNeutralSecondaryR14(
                              context,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyleManager
                                    .textStyleBrandPrimaryDefaultB14(
                                  context,
                                ),
                                recognizer: _signUpRecognizer,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 24),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}