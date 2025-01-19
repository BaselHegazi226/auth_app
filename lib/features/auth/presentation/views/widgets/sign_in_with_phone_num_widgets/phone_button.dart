import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../../otp_view.dart';

class PhoneButton extends StatelessWidget {
  const PhoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        GoRouter.of(context).push(
          OtpView.id,
        );
      },
      backgroundColor: kPhoneLeftColor,
      shadowColor: kPhoneLeftColor,
      child: CustomTitle(
        title: 'Send',
      ),
    );
  }
}
