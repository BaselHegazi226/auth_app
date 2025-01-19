import 'package:auth_with_firebase_application/core/utilities/text_styles.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/otp_view_widgets/otp_view_body.dart';
import 'package:flutter/material.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
  static String id = '/OtpView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP View',
          style: Styles.textStyleFun(
            color: Colors.grey,
            size: 24,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
      ),
      body: OtpViewBody(),
    );
  }
}
