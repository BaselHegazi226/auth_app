import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utilities/custom_circle_indicator.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../../../manager/auth_manager/auth_bloc.dart';

class SignUPButton extends StatelessWidget {
  const SignUPButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.autoValidateMode,
    //required this.onReset,
    required this.onAutoValidateModeChanged,
    required this.isEnableButton,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController, passwordController;
  final AutovalidateMode autoValidateMode;
  //final Function onReset;
  final Function(AutovalidateMode) onAutoValidateModeChanged;
  final bool isEnableButton;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      shadowColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      onPressed: isEnableButton
          ? () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthBloc>(context).add(
                  SignUpEvent(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
                FocusScope.of(context).unfocus();
              } else {
                onAutoValidateModeChanged(AutovalidateMode.always);
              }
            }
          : null,
      child: !isEnableButton
          ? const CustomCircleIndicator()
          : const CustomTitle(
              title: 'Sign Up',
            ),
    );
  }
}
