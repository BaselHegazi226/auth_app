import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextFormField(
        hintText: 'Phone Number',
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.green,
        ),
        textEditingController: widget.phoneController,
        keyboardType: TextInputType.phone,
        textColor: Colors.green,
      ),
    );
  }
}
