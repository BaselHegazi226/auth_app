import 'package:flutter/material.dart';

import '../../../../../../core/utilities/text_styles.dart';

class SignInWithPhoneNumViewBody extends StatelessWidget {
  const SignInWithPhoneNumViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Phone Number Sign In',
          style: Styles.textStyleFun(
            color: Colors.green,
            size: 24,
          ),
        ),
      ),
    );
  }
}
