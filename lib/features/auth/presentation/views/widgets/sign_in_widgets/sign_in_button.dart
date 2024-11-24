import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utilities/custom_circle_indicator.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../../../manager/auth_manager/auth_bloc.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isEnableButton,
    required this.backValidate,
    required this.autoValidateMode,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController, passwordController;
  final bool isEnableButton;
  final Function(AutovalidateMode) backValidate;
  final AutovalidateMode autoValidateMode;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      shadowColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      onPressed: isEnableButton
          ? () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthBloc>(context).add(
                  SignInEvent(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
                FocusScope.of(context).unfocus();
              } else {
                backValidate(AutovalidateMode.always);
              }
            }
          : null,
      child: !isEnableButton
          ? const CustomCircleIndicator()
          : const CustomTitle(
              buttonTitle: 'Sign In',
            ),
    );
  }
}
