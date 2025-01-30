import 'package:auth_with_firebase_application/core/helper/const_variables.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class HeightWidthPinPutOtp {
  static Tuple2<double, double> backSizeFun(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height * .06;
    final double width = MediaQuery.sizeOf(context).width * .13;
    return Tuple2(height, width);
  }
}

class PinThemesPinPutOtpClass {
  static PinTheme customPinThemeFunc(
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
        color: kOtpLeftColor.withAlpha(80),
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
