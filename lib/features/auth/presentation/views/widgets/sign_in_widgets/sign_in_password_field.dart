import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SingInPasswordField extends StatefulWidget {
  const SingInPasswordField({
    super.key,
    required this.color,
    required this.passwordFocusNode,
    required this.validator,
    required this.passwordController,
  });
  final Color color;
  final FocusNode passwordFocusNode;
  final String? Function(String?)? validator;
  final TextEditingController passwordController;
  @override
  State<SingInPasswordField> createState() => _SingInPasswordFieldState();
}

class _SingInPasswordFieldState extends State<SingInPasswordField> {
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye;
  String? password;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      height: MediaQuery.of(context).size.height * .12,
      width: MediaQuery.of(context).size.width * .9,
      textColor: widget.color,
      focusNode: widget.passwordFocusNode,
      validator: widget.validator,
      obscureText: obscurePassword,
      hintText: 'Password',
      textEditingController: widget.passwordController,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icon(
        Icons.lock_sharp,
        color: widget.color,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscurePassword = !obscurePassword;
            iconPassword =
                obscurePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash;
          });
        },
        icon: Icon(
          iconPassword,
          color: widget.color,
        ),
      ),
    );
  }
}
