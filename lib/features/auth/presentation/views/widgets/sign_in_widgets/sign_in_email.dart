import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignInEmailField extends StatelessWidget {
  const SignInEmailField({
    super.key,
    required this.color,
    required this.emailFocusNode,
    required this.emailController,
    required this.validator,
  });
  final Color color;
  final FocusNode emailFocusNode;
  final TextEditingController emailController;
  final String? Function(String?)? validator;
  //final String errorFromAuth;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textColor: color,
      focusNode: emailFocusNode,
      validator: validator,
      hintText: 'Email',
      textEditingController: emailController,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(
        Icons.email_rounded,
        color: color,
      ),
    );
  }
}
