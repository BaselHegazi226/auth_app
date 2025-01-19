import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_functions.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';

class PhoneTextFormField extends StatefulWidget {
  const PhoneTextFormField({
    super.key,
    required this.phoneController,
    required this.phoneFocusNode,
  });
  final TextEditingController phoneController;
  final FocusNode phoneFocusNode;

  @override
  State<PhoneTextFormField> createState() => _PhoneTextFormFieldState();
}

class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      height: MediaQuery.of(context).size.height * .12,
      width: MediaQuery.of(context).size.width * .9,
      hintText: 'Phone Number',
      prefixIcon: Icon(
        Icons.phone,
        color: ConstFunctions.colorBackFun(
          condition: widget.phoneFocusNode.hasFocus,
          word: 'phone',
        ),
      ),
      textEditingController: widget.phoneController,
      focusNode: widget.phoneFocusNode,
      keyboardType: TextInputType.phone,
      textColor: ConstFunctions.colorBackFun(
        condition: widget.phoneFocusNode.hasFocus,
        word: 'phone',
      ),
    );
  }
}
