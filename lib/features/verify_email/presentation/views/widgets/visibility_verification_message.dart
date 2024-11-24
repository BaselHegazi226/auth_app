import 'package:flutter/material.dart';

class VisibilityVerificationMessage extends StatelessWidget {
  const VisibilityVerificationMessage({
    super.key,
    required this.isActiveButton,
    required this.child,
  });
  final bool isActiveButton;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: isActiveButton ? child : SizedBox(),
    );
  }
}
