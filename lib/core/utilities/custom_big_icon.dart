import 'package:flutter/material.dart';

class CustomBigIcon extends StatelessWidget {
  const CustomBigIcon({
    super.key,
    required this.iconData,
    this.iconColor = Colors.white,
  });
  final IconData iconData;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * .7,
          child: Icon(
            iconData,
            size: 150,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}
