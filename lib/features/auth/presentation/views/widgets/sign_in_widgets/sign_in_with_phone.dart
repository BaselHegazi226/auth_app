import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/constant.dart';
import '../../../../../../core/utilities/AssetsData.dart';
import '../../../../../../core/utilities/custom_icon_button.dart';
import '../../verify_phone_num_view.dart';

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
