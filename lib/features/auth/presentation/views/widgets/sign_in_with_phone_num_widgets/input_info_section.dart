import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_with_phone_num_widgets/phone_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../../../../../../core/utilities/text_styles.dart';

class InputInfoSection extends StatelessWidget {
  const InputInfoSection({
    super.key,
    required this.phoneEditingController,
  });
  final TextEditingController phoneEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              "Enter your phone number",
              style: Styles.textStyleFun(
                color: Color.fromRGBO(102, 187, 106, 1),
                size: MediaQuery.of(context).size.width * .045,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        PhoneTextFormField(
          phoneController: phoneEditingController,
        ),
        SizedBox(
          height: 24,
        ),
        CustomTextButton(
          onPressed: () {},
          backgroundColor: Color.fromRGBO(102, 187, 106, 1),
          shadowColor: Color.fromRGBO(144, 238, 144, 1),
          child: CustomTitle(
            title: 'Send',
          ),
        ),
      ],
    );
  }
}
