import 'package:flutter/material.dart';

import '../auth_widgets/filter_section.dart';

class SignInWithPhoneNumViewBody extends StatelessWidget {
  const SignInWithPhoneNumViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FilterSection(), // Fixed background
      ],
    );
  }
}
