import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class HeightWidthPinPutOtp {
  static Tuple2<double, double> backSizeFun(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height * .07;
    final double width = MediaQuery.sizeOf(context).width * .15;
    return Tuple2(height, width);
  }
}

class PinThemesPinPutOtp {
  static PinTheme customPinTheme(
    BuildContext context, {
    required double height,
    required double width,
    required double fontSize,
    required Color textColor,
    required Color backgroundColor,
    required Color borderColor,
    required double borderRadius,
  }) {
    return PinTheme(
      height: height,
      width: width,
      textStyle: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: 2,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
    );
  }
}
