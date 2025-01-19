import 'package:auth_with_firebase_application/core/helper/custom_flexible_widget.dart';
import 'package:auth_with_firebase_application/core/utilities/custom_big_icon.dart';
import 'package:flutter/material.dart';

import '../auth_widgets/filter_section.dart';
import 'input_info_section.dart';

class SignInWithPhoneNumViewBody extends StatelessWidget {
  SignInWithPhoneNumViewBody({super.key});
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FilterSection(
          leftColor: Color.fromRGBO(174, 213, 129, 1),
          centerColor: Colors.white,
          rightColor: Color.fromRGBO(102, 187, 106, 1),
        ),
        const CustomBigIcon(
          iconData: Icons.phone,
        ),
        Center(
          child: CustomFlexibleWidget(
              widget: InputInfoSection(
            phoneEditingController: phoneController,
          )),
        )
      ],
    );
  }
}
