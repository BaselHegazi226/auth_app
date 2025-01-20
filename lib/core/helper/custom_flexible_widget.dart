import 'package:flutter/material.dart';

class CustomFlexibleWidget extends StatelessWidget {
  const CustomFlexibleWidget({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    //make the child of it move from above to down as one item
    // or give dynamic or the size which child can take
    // and make it scroll in this height
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
