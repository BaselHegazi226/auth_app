import 'package:auth_with_firebase_application/core/utilities/custom_text_form_field_otp.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/helper/pin_themes.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';

class OtpInputInfoSection extends StatefulWidget {
  const OtpInputInfoSection({super.key});

  @override
  State<OtpInputInfoSection> createState() => _OtpInputInfoSectionState();
}

class _OtpInputInfoSectionState extends State<OtpInputInfoSection> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 32,
        children: [
          CustomTextFormFieldOtpPinPut(
            defaultPinTheme:
                PinThemesPinPutOtpClass.customPinThemeFunc(context),
            disabledPinTheme:
                PinThemesPinPutOtpClass.customPinThemeFunc(context),
            focusedPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
              context,
              borderColor: kOtpLeftColor,
            ),
            errorPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
              context,
              borderColor: kErrorColor,
            ),
            pinCount: 6,
            validator: (value) {
              return '';
            },
          ),
          CustomTextButton(
            onPressed: () {},
            backgroundColor: kOtpLeftColor,
            shadowColor: kOtpCenterColor,
            child: CustomTitle(
              title: 'Verify',
            ),
          ),
        ],
      ),
    );
  }
}
