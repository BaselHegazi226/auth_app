import 'package:flutter/material.dart';

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
      onPressed: () {},
      title: 'Phone',
    );
  }
}
