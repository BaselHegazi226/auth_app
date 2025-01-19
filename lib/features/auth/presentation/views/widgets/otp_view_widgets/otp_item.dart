import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';

class OtpItem extends StatelessWidget {
  const OtpItem({
    super.key,
    required this.otpController,
  });
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      width: MediaQuery.of(context).size.height * .053,
      hintText: '',
      textEditingController: otpController,
      keyboardType: TextInputType.number,
      textColor: kOtpCenterColor,
      height: MediaQuery.of(context).size.height * .053,
    );
  }
}
