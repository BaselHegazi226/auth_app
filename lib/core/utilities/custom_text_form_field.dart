import 'package:auth_with_firebase_application/core/helper/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode; // Added FocusNode
  final String? Function(String?)? validator;
  final String? errorMess;
  final void Function(String)? onChanged;
  final Color textColor;
  // final void Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.keyboardType,
    required this.textColor,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.validator,
    this.errorMess,
    // required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: TextFormField(
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        // onSaved: onSaved,
        controller: textEditingController,
        obscureText: obscureText,
        onChanged: onChanged,
        focusNode: focusNode, // Assigned FocusNode
        validator: validator,
        textInputAction: TextInputAction.next,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w800,
          fontFamily: 'cairoPlay',
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixStyle: TextStyle(
            color: textColor,
          ),
          prefixStyle: TextStyle(
            color: textColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontFamily: 'cairo',
          ),
          border: outlineInputBorder(
            borderRadius: 8,
            color: Colors.transparent,
          ),
          enabledBorder: outlineInputBorder(
            borderRadius: 8,
            color: Colors.transparent,
          ),
          focusedBorder: outlineInputBorder(
            borderRadius: 8,
            color: textColor, // Focus color applied here
          ),
          disabledBorder: outlineInputBorder(
            borderRadius: 8,
            color: Colors.transparent,
          ),
          errorBorder: outlineInputBorder(
            borderRadius: 8,
            color: focusNode != null && focusNode!.hasFocus
                ? textColor // Change to focus color on error
                : kErrorColor,
          ),
          focusedErrorBorder: outlineInputBorder(
            borderRadius: 8,
            color: focusNode != null && focusNode!.hasFocus
                ? textColor // Change to focus color on error
                : kErrorColor,
          ),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            fontFamily: 'ubuntuCondensed',
          ),
          errorText: errorMess,
          fillColor: kFilledTextFormFieldColor.withOpacity(.18),
          filled: true,
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({
    required double borderRadius,
    required Color color,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
    );
  }
}
