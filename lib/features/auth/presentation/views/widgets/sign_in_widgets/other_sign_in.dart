import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_with_facebook.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_with_google.dart';
import 'package:flutter/material.dart';

class OtherSignIn extends StatelessWidget {
  const OtherSignIn({
    super.key,
    required this.isEnableButton,
  });
  final bool isEnableButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignInWithGoogle(
          isEnableGoogleButton: isEnableButton,
        ),
        SizedBox(width: 16),
        // SignInWithMac(),
        // SizedBox(width: 4),
        SignInWithFacebook(
          isEnableFacebookButton: isEnableButton,
        ),
      ],
    );
  }
}
