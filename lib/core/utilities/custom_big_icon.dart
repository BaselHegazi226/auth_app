import 'package:flutter/material.dart';

class CustomBigIcon extends StatelessWidget {
  const CustomBigIcon({
    super.key,
    required this.iconData,
  });
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          child: Icon(
            iconData,
            size: 150,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ],
    );
  }
}
