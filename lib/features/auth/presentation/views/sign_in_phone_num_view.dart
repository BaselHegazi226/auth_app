import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_with_phone_num_widgets/sign_in_with_phone_num_view_body.dart';
import 'package:flutter/material.dart';

class SignInPhoneNumView extends StatelessWidget {
  static String id = '/verifyPhoneNumView';
  const SignInPhoneNumView({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInWithPhoneNumViewBody();
  }
}
