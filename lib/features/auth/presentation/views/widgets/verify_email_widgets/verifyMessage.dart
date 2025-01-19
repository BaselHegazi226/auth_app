import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_title.dart';

class VerifyMessage extends StatelessWidget {
  const VerifyMessage({
    super.key,
    required this.verifyMessage,
  });
  final String verifyMessage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: CustomTitle(
            size: 22,
            title: verifyMessage,
            textColor: kEmailFocusColor,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Icon(
          Icons.alarm,
          color: kEmailFocusColor,
          size: 28,
        ),
      ],
    );
  }
}
