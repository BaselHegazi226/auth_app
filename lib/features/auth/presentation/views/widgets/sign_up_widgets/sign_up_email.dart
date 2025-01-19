import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignUpEmail extends StatelessWidget {
  const SignUpEmail({
    super.key,
    required this.color,
    required this.emailFocusNode,
    required this.textEditingController,
    required this.validator,
  });
  final Color color;
  final FocusNode emailFocusNode;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  //final String errorFromAuth;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      height: MediaQuery.of(context).size.height * .12,
      width: MediaQuery.of(context).size.width * .9,
      textColor: color,
      focusNode: emailFocusNode,
      validator: validator,
      hintText: 'Email',
      textEditingController: textEditingController,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(
        Icons.email_rounded,
        color: color,
      ),
    );
  }
}
