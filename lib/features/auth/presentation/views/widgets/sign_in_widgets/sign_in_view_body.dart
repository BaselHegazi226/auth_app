import 'package:auth_with_firebase_application/core/helper/const_functions.dart';
import 'package:auth_with_firebase_application/core/utilities/custom_title.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/sign_in_view.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_button.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_email.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_password_field.dart';
import 'package:auth_with_firebase_application/features/home/presentation/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../manager/auth_manager/auth_bloc.dart';
import '../../forget_password_view.dart';
import 'or_sign_in_with.dart';
import 'other_sign_in.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool obscurePassword = true;
  bool forgetPassword = false;
  bool isEnableButton = true;
  IconData iconPassword = CupertinoIcons.eye;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? emailErrorMessage;
  String? passwordErrorMessage;

  @override
  Widget build(BuildContext context) {
    //make build bloc to handle the different states of the click event on sign in button
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          successStateFun(context);
        } else if (state is SignInFailure) {
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
              SignInEmailField(
                emailController: emailController,
                color: ConstFunctions.colorBackFun(
                  condition: emailFocusNode.hasFocus,
                  word: 'email',
                ),
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
                    print('email error : $emailErrorMessage');
                    return emailErrorMessage;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SingInPasswordField(
                color: ConstFunctions.colorBackFun(
                  condition: passwordFocusNode.hasFocus,
                  word: 'password',
                ),
                passwordFocusNode: passwordFocusNode,
                passwordController: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  } else if (passwordErrorMessage != null) {
                    return passwordErrorMessage;
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      passwordController.clear();
                      GoRouter.of(context).push(ForgetPasswordView.id);
                    },
                    child: CustomTitle(
                      title: 'Forget password ?',
                      textColor: kFocusForgetPassColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SignInButton(
                  formKey: _formKey,
                  autoValidateMode: autoValidateMode,
                  emailController: emailController,
                  passwordController: passwordController,
                  isEnableButton: isEnableButton,
                  backValidate: (mode) {
                    setState(() {
                      autoValidateMode = mode;
                    });
                  }),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: OrSignInWithText(
                  color: kDisableColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              OtherSignIn(
                isEnableButton: isEnableButton,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    focusListenerFun();
    controllerListenerFun();
  }

  void focusListenerFun() {
    //to make the email field is focus when i press on it
    emailFocusNode.addListener(() {
      setState(() {});
    });
    //to make the password field is focus when i press on it
    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  void controllerListenerFun() {
    //to listen to the action which happens in the email controller field
    emailController.addListener(emailControllerFun);
    //to make the password controller field listen to is the field is empty or filled or have error message
    passwordController.addListener(passwordControllerFun);
  }

  @override
  void dispose() {
    focusDisposeFun();
    removeControlFun();
    super.dispose();
  }

  void focusDisposeFun() {
    //to terminate the focus of email field as soon as moving to any field
    emailFocusNode.dispose();
    //to terminate the focus of password field as soon as moving to any field
    passwordFocusNode.dispose();
  }

  void removeControlFun() {
    emailController.removeListener(emailControllerFun);
    passwordController.removeListener(passwordControllerFun);
  }

  void emailControllerFun() {
    setState(() {
      emailErrorMessage = null;
      isEnableButton = true;
    });
  }

  void passwordControllerFun() {
    setState(() {
      passwordErrorMessage = null;
      isEnableButton = true;
    });
  }

  void successStateFun(BuildContext context) {
    // Navigate to the HomeView first
    GoRouter.of(context).push(
      HomeView.id,
      extra: SignInView.id,
    );
    onResetFun();
  }

  void failureStateFun(SignInFailure state) {
    setState(
      () {
        switch (state.errorMessage) {
          //to put the error message of email field
          case 'No user found with this email.':
            emailErrorMessage = state.errorMessage;
            passwordErrorMessage = null;
            break;
          case 'Invalid password.':
            //to put the error message of password field
            emailErrorMessage = null;
            passwordErrorMessage = 'Check password or press forget password ?';
            break;
          default:
            //to make the error message of the two fields is null
            emailErrorMessage = null;
            passwordErrorMessage = null;
        }
        //to reActive the sign in button
        isEnableButton = true;
        //to back with validate mode to focus mode
        autoValidateMode = AutovalidateMode.always;
        // After the state is updated, trigger validation
        _formKey.currentState?.validate();
      },
    );
  }

  void loadedStateFun() {
    setState(
      () {
        //to make the isEnableButton is false when the event is in the load state
        isEnableButton = false;
      },
    );
  }

  void onResetFun() {
    setState(() {
      //reActive the sign in button
      isEnableButton = true;
      //make the sate of the form is disable to enable me to sign in Later
      autoValidateMode = AutovalidateMode.disabled;
    });
  }
}
