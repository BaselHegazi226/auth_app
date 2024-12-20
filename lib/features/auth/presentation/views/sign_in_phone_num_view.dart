import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_with_phone_num_widgets/sign_in_with_phone_num_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/text_styles.dart';

class SignInPhoneNumView extends StatelessWidget {
  static String id = '/signInPhoneNumView';
  const SignInPhoneNumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Phone Number Sign In',
          style: Styles.textStyleFun(
            color: Colors.green,
            size: 24,
          ),
        ),
      ),
      body: SignInWithPhoneNumViewBody(),
    );
  }
}
