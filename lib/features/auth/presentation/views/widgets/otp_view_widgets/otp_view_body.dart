import 'package:auth_with_firebase_application/core/helper/const_variables.dart';
import 'package:auth_with_firebase_application/core/helper/custom_flexible_widget.dart';
import 'package:auth_with_firebase_application/core/utilities/custom_big_icon.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/auth_widgets/filter_section.dart';
import 'package:flutter/material.dart';

import 'otp_input_info_section.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFlexibleWidget(
      widget: Stack(
        children: [
          FilterSection(
            rightColor: kOtpRightColor,
            leftColor: kOtpLeftColor,
            centerColor: kOtpCenterColor,
          ),
          Align(
            alignment: Alignment(0, -.85),
            child: CustomBigIcon(
              iconData: Icons.phone,
              iconColor: Colors.white.withAlpha(200),
            ),
          ),
          OtpInputInfoSection(),
        ],
      ),
    );
  }
}
