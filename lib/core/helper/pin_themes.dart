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
    Color textColor = Colors.blueGrey,
    Color borderColor = Colors.transparent,
    double borderRadius = 8,
  }) {
    return PinTheme(
      height: HeightWidthPinPutOtp.backSizeFun(context).value1,
      width: HeightWidthPinPutOtp.backSizeFun(context).value2,
      textStyle: TextStyle(
        fontSize: 24,
        color: textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'ubuntuCondensed',
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(64),
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
