import 'package:auth_with_firebase_application/core/utilities/custom_big_icon.dart';
import 'package:auth_with_firebase_application/core/utilities/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../auth_widgets/filter_section.dart';

class SignInWithPhoneNumViewBody extends StatelessWidget {
  SignInWithPhoneNumViewBody({super.key});
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //center color Color.fromRGBO(144, 238, 144, 1),
    return Stack(
      children: [
        FilterSection(
          leftColor: Color.fromRGBO(174, 213, 129, 1),
          centerColor: Colors.white,
          rightColor: Color.fromRGBO(102, 187, 106, 1),
        ),
        CustomBigIcon(
          iconData: Icons.phone,
        ),
        Center(
          child: CustomTextFormField(
            hintText: 'Phone Number',
            suffixIcon: Icon(
              Icons.phone,
              color: Colors.green,
            ),
            textEditingController: phoneController,
            keyboardType: TextInputType.phone,
            textColor: Colors.green,
          ),
        ) // Fixed background,)
      ],
    );
  }
}
