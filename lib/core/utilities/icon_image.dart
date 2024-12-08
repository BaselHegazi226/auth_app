import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  const IconImage({
    super.key,
    required this.image,
    required this.errorImage,
    required this.imageColor,
    required this.onPressed,
  });
  final String image;
  final String errorImage;
  final void Function()? onPressed;
  final Color imageColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(.1),
      onPressed: onPressed,
      icon: Container(
        height: MediaQuery.of(context).size.height * .055,
        width: MediaQuery.of(context).size.width * .11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: imageColor,
        ),
        child: CachedNetworkImage(
          placeholder: (
            context,
            url,
          ) {
            return Image.asset(
              errorImage,
              fit: BoxFit.fill,
            );
          },
          imageUrl: image,
          fit: BoxFit.cover,
          errorWidget: (
            context,
            error,
            url,
          ) {
            return Container(
              height: MediaQuery.of(context).size.height * .06,
              width: MediaQuery.of(context).size.width * .12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: ThemeData().colorScheme.primary,
              ),
            );
          },
        ),
      ),
    );
  }
}
