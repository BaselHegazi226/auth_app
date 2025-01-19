import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
    this.centerColor = kFilterCenterColor,
    this.rightColor = kFilterRightColor,
    this.leftColor = kFilterLeftColor,
  });
  final Color centerColor, rightColor, leftColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const Alignment(20, -1.2),
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: centerColor,
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-2.7, -1.2),
          child: Container(
            height: MediaQuery.of(context).size.width / 1.3,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: leftColor,
            ),
          ),
        ),
        Align(
          alignment: const Alignment(2.7, -1.2),
          child: Container(
            height: MediaQuery.of(context).size.width / 1.3,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: rightColor,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 100,
            sigmaY: 100,
          ),
          child: Container(),
        ),
      ],
    );
  }
}
