import 'package:auth_with_firebase_application/core/helper/const_variables.dart';
import 'package:auth_with_firebase_application/core/helper/custom_flexible_widget.dart';
import 'package:auth_with_firebase_application/core/utilities/custom_big_icon.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/auth_widgets/filter_section.dart';
import 'package:flutter/material.dart';

import 'otp_item.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();
  final TextEditingController otp5 = TextEditingController();
  final TextEditingController otp6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FilterSection(
          rightColor: kOtpRightColor,
          centerColor: kOtpCenterColor,
          leftColor: kOtpLeftColor,
        ),
        const CustomBigIcon(iconData: Icons.verified),
        CustomFlexibleWidget(
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OtpItem(
                otpController: otp1,
              ),
              const SizedBox(width: 6),
              OtpItem(
                otpController: otp2,
              ),
              const SizedBox(width: 6),
              OtpItem(
                otpController: otp3,
              ),
              const SizedBox(width: 6),
              OtpItem(
                otpController: otp4,
              ),
              const SizedBox(width: 6),
              OtpItem(
                otpController: otp5,
              ),
              const SizedBox(width: 6),
              OtpItem(
                otpController: otp6,
              ),
            ],
          ),
        )
      ],
    );
  }
}
