import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_functions.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';

class PhoneTextFormField extends StatefulWidget {
  const PhoneTextFormField({
    super.key,
    required this.phoneController,
  });
  final TextEditingController phoneController;

  @override
  State<PhoneTextFormField> createState() => _PhoneTextFormFieldState();
}

class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
  final FocusNode phoneFocusNode = FocusNode();
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
    return CustomTextFormField(
      hintText: 'Phone Number',
      prefixIcon: Icon(
        Icons.phone,
        color: Colors.green,
      ),
      textEditingController: widget.phoneController,
      focusNode: phoneFocusNode,
      keyboardType: TextInputType.number,
      textColor: ConstFunctions.colorBackFun(
        condition: phoneFocusNode.hasFocus,
        word: 'phone',
      ),
    );
  }
}
