import 'package:flutter/material.dart';

import 'icon_image.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.image,
    required this.onPressed,
    required this.title,
    this.textColor = Colors.black,
    this.imageColor = Colors.grey,
    required this.errorLoadImage,
  });
  final String image;
  final String errorLoadImage;
  final void Function()? onPressed;
  final String title;
  final Color textColor;
  final Color imageColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconImage(
          imageColor: imageColor,
          image: image,
          errorImage: errorLoadImage,
          onPressed: onPressed,
        ),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: 20,
            fontFamily: 'cairo',
          ),
        ),
      ],
    );
  }
}
