import 'package:auth_with_firebase_application/core/helper/const_variables.dart';
import 'package:auth_with_firebase_application/core/helper/custom_flexible_widget.dart';
import 'package:auth_with_firebase_application/core/utilities/custom_big_icon.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/auth_widgets/filter_section.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/otp_view_widgets/otp_section.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  // final TextEditingController otp1 = TextEditingController();
  // final TextEditingController otp2 = TextEditingController();
  // final TextEditingController otp3 = TextEditingController();
  // final TextEditingController otp4 = TextEditingController();
  // final TextEditingController otp5 = TextEditingController();
  // final TextEditingController otp6 = TextEditingController();
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
            alignment: Alignment(0, -.8),
            child: const CustomBigIcon(iconData: Icons.verified),
          ),
          Center(
            child: OtpSection(),
          ),
          Align(
            alignment: Alignment(0, -.4),
            child: CustomTextButton(
              onPressed: () {},
              backgroundColor: Colors.grey,
              shadowColor: Colors.grey.withAlpha(128),
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
