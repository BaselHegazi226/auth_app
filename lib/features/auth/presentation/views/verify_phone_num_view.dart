import 'package:flutter/material.dart';

class VerifyPhoneNumView extends StatelessWidget {
  static String id = '/verifyPhoneNumView';
  const VerifyPhoneNumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Phone Number'),
      ),
    );
  }
}
