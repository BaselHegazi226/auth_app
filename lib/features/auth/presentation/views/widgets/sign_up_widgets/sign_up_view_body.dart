import 'package:auth_with_firebase_application/core/utilities/show_snack_bar.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/manager/auth_manager/auth_bloc.dart';
import 'package:auth_with_firebase_application/features/verify_email/presentation/views/verify_email_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/constant.dart';
import 'check_password_section.dart';
import 'sign_up_button.dart';
import 'sign_up_email.dart';
import 'sign_up_password.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          successStateFun(context);
        } else if (state is SignUpFailure) {
          failureStateFun(state);
        } else {
          loadedStateFun();
        }
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: autoValidateMode,
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 16),
              SignUpEmail(
                textEditingController: emailController,
                color: emailFocusNode.hasFocus ? kFocusColor : kDisableColor,
                emailFocusNode: emailFocusNode,
                validator: (value) {
                  String trimmedValue = value!.trim();
                  if (trimmedValue.isEmpty) {
                    return 'Please Enter An Email';
                  } else if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$')
                      .hasMatch(trimmedValue)) {
                    return 'Please Enter A Valid Email! (abc@gmail.com)';
                  } else if (emailErrorMessage != null) {
                    return emailErrorMessage; // Return the error message from state
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SignUpPassword(
                textEditingController: passwordController,
                color: passwordFocusNode.hasFocus ? kFocusColor : kDisableColor,
                passwordFocusNode: passwordFocusNode,
                onChanged: (value) {
                  setState(() {
                    regExpForCheckPasswordVarsFunc(value);
                  });
                },
              ),
              const SizedBox(height: 8),
              CheckPasswordSection(
                containsPassLength: containsPassLength,
                containsSpecialChar: containsSpecialChar,
                containsNumber: containsNumbers,
                containsUpperCase: containsUpperCase,
                containsLowerCase: containsLowerCase,
              ),
              const SizedBox(height: 24),
              SignUPButton(
                  isEnableButton: isEnableButton,
                  formKey: _formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  autoValidateMode: autoValidateMode,
                  onAutoValidateModeChanged: (mode) {
                    setState(() {
                      autoValidateMode = mode;
                    });
                  })
            ],
          ),
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool obscurePassword = true;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsSpecialChar = false;
  bool containsNumbers = false;
  bool containsPassLength = false;
  bool isEnableButton = true;

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? emailErrorMessage;

  @override
  void initState() {
    super.initState();
    focusFun();
    emailController.addListener(onEmailChanged); // Listen to email changes
  }

  @override
  void dispose() {
    disposeFun();
    emailController
        .removeListener(onEmailChanged); // Remove listener on dispose
    super.dispose();
  }

  // Called when the email is modified
  void onEmailChanged() {
    setState(() {
      emailErrorMessage = null; // Reset error message when email changes
    });
  }

  void clearFun() {
    emailController.clear();
    passwordController.clear();
  }

  void focusFun() {
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  void disposeFun() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  void regExpForCheckPasswordVarsFunc(String value) {
    containsLowerCase = RegExp(r'(?=.*[a-z])').hasMatch(value);
    containsUpperCase = RegExp(r'(?=.*[A-Z])').hasMatch(value);
    containsNumbers = RegExp(r'(?=.*\d)').hasMatch(value);
    containsSpecialChar = RegExp(r'[^a-zA-Z0-9\s]').hasMatch(value);
    containsPassLength = RegExp(r'.{8,}').hasMatch(value);
  }

  void onResetFun() {
    clearFun();
    defaultPasswordChecksFun();
    setState(() {
      autoValidateMode = AutovalidateMode.disabled;
      isEnableButton = true;
      emailErrorMessage = null; // Clear error message on reset
    });
  }

  void defaultPasswordChecksFun() {
    setState(() {
      containsNumbers = false;
      containsSpecialChar = false;
      containsPassLength = false;
      containsUpperCase = false;
      containsLowerCase = false;
    });
  }

  void loadedStateFun() {
    setState(() {
      isEnableButton = false;
    });
  }

  void failureStateFun(SignUpFailure state) {
    setState(
      () {
        emailErrorMessage = state.errorMessage;
        isEnableButton = true;
        autoValidateMode =
            AutovalidateMode.always; // Trigger validation after an error
        _formKey.currentState?.validate(); // Trigger form re-validation
      },
    );
  }

  void successStateFun(BuildContext context) {
    GoRouter.of(context).push(
      VerifyEmailView.id,
    );
    showSnackBar(context, 'Success sign up ', kFocusColor);
    onResetFun();
  }
}
