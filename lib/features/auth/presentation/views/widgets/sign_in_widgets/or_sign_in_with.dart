import 'package:flutter/material.dart';

class OrSignInWithText extends StatelessWidget {
  const OrSignInWithText({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1.5,
                color: color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'or sign in with',
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1.5,
                color: color,
              ),
            ),
          ],
        )
      ],
    );
  }
}
