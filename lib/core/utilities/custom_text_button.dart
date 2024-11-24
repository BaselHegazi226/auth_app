import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.backgroundColor,
    required this.shadowColor,
  });
  final Widget child;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color shadowColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shadowColor: shadowColor,
          elevation: 5,
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
