import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignUpPassword extends HookWidget {
  const SignUpPassword({
    super.key,
    required this.color,
    required this.passwordFocusNode,
    required this.onChanged,
    required this.textEditingController,
  });

  final Color color;
  final FocusNode passwordFocusNode;
  final void Function(String)? onChanged;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final obscurePassword = useState(true);
    final iconPassword =
        obscurePassword.value ? CupertinoIcons.eye : CupertinoIcons.eye_slash;

    return CustomTextFormField(
      onChanged: onChanged,
      textColor: color,
      focusNode: passwordFocusNode,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        } else if (!RegExp(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)[A-Za-z\d\W]{8,}$')
            .hasMatch(value)) {
          return 'Please enter a valid password! (Aa#12345)';
        }
        return null;
      },
      obscureText: obscurePassword.value,
      hintText: 'Password',
      textEditingController: textEditingController,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icon(
        Icons.lock_rounded,
        color: color,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          obscurePassword.value = !obscurePassword.value;
        },
        icon: Icon(
          iconPassword,
          color: color,
        ),
      ),
    );
  }
}
