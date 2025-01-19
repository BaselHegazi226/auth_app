import 'package:flutter/material.dart';

class CustomFlexibleWidget extends StatelessWidget {
  const CustomFlexibleWidget({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: widget,
        ),
      ),
    );
  }
}
