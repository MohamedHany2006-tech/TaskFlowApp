import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/core/Forms/Authontication/manager/Auth_Cubit.dart';
import 'package:to_do_list/core/Forms/Authontication/manager/Auth_State.dart';
import 'package:to_do_list/core/Share/widgets/cutome_main_btn.dart';
import 'package:to_do_list/core/Share/widgets/text_input_field.dart';
import 'package:to_do_list/core/Utilis/unints.dart';
import 'package:to_do_list/core/navigation/Routes.dart';
import 'package:to_do_list/core/style/TextStyleManager.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SuccessRegisterState) {
            context.go(Routes.kHome);
          } else if (state is FailureRegisterState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Units.getWidth(
                  context: context,
                  value: 24,
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 40,
                      ),
                    ),

                    Center(
                      child: Text(
                        'Create account',
                        style: TextStyleManager
                            .textStyleNeutralPrimarySB24(context),
                      ),
                    ),

                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 8,
                      ),
                    ),

                    Center(
                      child: Text(
                        'Create your account and feel the benefits',
                        style: TextStyleManager
                            .textStyleNeutralSecondaryR14(context),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 48,
                      ),
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
                      height: Units.getHeight(
                        context: context,
                        value: 24,
                      ),
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

                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }

                        return null;
                      },
                    ),

                    const Spacer(),

                    state is LoadingRegisterState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CutomeMainBtn(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<AuthCubit>()
                                    .createAccount(
                                      email:
                                          _emailController.text.trim(),
                                      password:
                                          _passwordController.text.trim(),
                                    );
                              }
                            },
                            btnTitle: 'Continue',
                          ),

                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 16,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyleManager
                                .textStyleNeutralSecondaryR14(context),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyleManager
                                    .textStyleBrandPrimaryDefaultB14(
                                  context,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.go(Routes.kLogin);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 24,
                      ),
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