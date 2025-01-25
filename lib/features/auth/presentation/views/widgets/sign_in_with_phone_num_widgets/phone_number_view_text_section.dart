import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_functions.dart';
import '../../../../../../core/utilities/text_styles.dart';

class PhoneNumberViewTextSection extends StatelessWidget {
  const PhoneNumberViewTextSection({super.key, required this.phoneFocusNode});
  final FocusNode phoneFocusNode;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Text(
          "Enter your phone number",
          style: Styles.textStyleFun(
            color: ConstFunctions.colorBackFun(
              condition: phoneFocusNode.hasFocus,
              word: 'phone',
            ),
            size: MediaQuery.of(context).size.width * .045,
          ).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
