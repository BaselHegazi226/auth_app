import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.buttonTitle,
    this.textColor = Colors.white,
    this.size = 24,
  });
  final String buttonTitle;
  final Color textColor;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      buttonTitle,
      style: TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: 'cairo',
      ),
    );
  }
}
