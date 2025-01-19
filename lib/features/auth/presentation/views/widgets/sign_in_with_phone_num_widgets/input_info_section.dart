import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_with_phone_num_widgets/phone_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_functions.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';
import '../../../../../../core/utilities/text_styles.dart';

class InputInfoSection extends StatefulWidget {
  const InputInfoSection({super.key});

  @override
  State<InputInfoSection> createState() => _InputInfoSectionState();
}

class _InputInfoSectionState extends State<InputInfoSection> {
  final TextEditingController phoneEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode phoneFocusNode = FocusNode();
  final AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    phoneFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
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
          ),
          SizedBox(
            height: 8,
          ),
          // PhoneTextFormField(
          //   phoneController: phoneEditingController,
          // ),
          CustomTextFormField(
            hintText: 'Phone Number',
            prefixIcon: Icon(
              Icons.phone,
              color: ConstFunctions.colorBackFun(
                condition: phoneFocusNode.hasFocus,
                word: 'phone',
              ),
            ),
            textEditingController: phoneEditingController,
            focusNode: phoneFocusNode,
            keyboardType: TextInputType.number,
            textColor: ConstFunctions.colorBackFun(
              condition: phoneFocusNode.hasFocus,
              word: 'phone',
            ),
          ),
          SizedBox(
            height: 24,
          ),
          PhoneButton(),
        ],
      ),
    );
  }
}
