import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/constant.dart';
import '../../../../../../core/utilities/AssetsData.dart';
import '../../../../../../core/utilities/custom_icon_button.dart';

class SignInWithPhone extends StatelessWidget {
  const SignInWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      textColor: kPhoneColor,
      imageColor: kPhoneColor,
      image: AssetsData.kPhoneImage,
      errorLoadImage: AssetsData.kPhoneOfflineImage,
      onPressed: () {
        GoRouter.of(context).push(VerifyPhoneNumView.id);
      },
      title: 'Phone',
    );
  }
}

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
