import 'package:flutter/material.dart';

import 'otp_item.dart';

class OtpSection extends StatelessWidget {
  const OtpSection(
      {super.key,
      required this.otp1,
      required this.otp2,
      required this.otp3,
      required this.otp4,
      required this.otp5,
      required this.otp6});
  final TextEditingController otp1, otp2, otp3, otp4, otp5, otp6;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
