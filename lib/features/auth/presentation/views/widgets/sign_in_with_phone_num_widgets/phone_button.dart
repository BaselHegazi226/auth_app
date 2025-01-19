import 'package:flutter/material.dart';

import '../../../../../../core/helper/constant.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';

class PhoneButton extends StatelessWidget {
  const PhoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {},
      backgroundColor: kPhoneRightColor,
      shadowColor: kPhoneLeftColor,
      child: CustomTitle(
        title: 'Send',
      ),
    );
  }
}
