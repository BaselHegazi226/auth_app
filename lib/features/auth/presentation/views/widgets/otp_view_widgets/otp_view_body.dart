import 'package:auth_with_firebase_application/core/helper/const_variables.dart';
import 'package:auth_with_firebase_application/core/helper/custom_flexible_widget.dart';
import 'package:auth_with_firebase_application/core/utilities/custom_big_icon.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/auth_widgets/filter_section.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import 'otp_section.dart';

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
    return CustomFlexibleWidget(
      widget: Stack(
        children: [
          FilterSection(
            rightColor: kOtpRightColor,
            centerColor: kOtpCenterColor,
            leftColor: kOtpLeftColor,
          ),
          Align(
            alignment: Alignment(0, -1.5),
            child: const CustomBigIcon(iconData: Icons.verified),
          ),
          Align(
            alignment: Alignment(0, -.3),
            child: OtpSection(
              otp1: otp1,
              otp2: otp2,
              otp3: otp3,
              otp4: otp4,
              otp5: otp5,
              otp6: otp6,
            ),
          ),
          Align(
            alignment: Alignment(0, -.05),
            child: CustomTextButton(
              onPressed: () {},
              backgroundColor: Colors.grey,
              shadowColor: Colors.grey.withOpacity(.5),
              child: CustomTitle(
                title: 'Verify',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
