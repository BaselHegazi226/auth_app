import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

Color kDisableColor = Colors.grey;
Color kFocusColor = const Color.fromRGBO(244, 143, 177, 1);
Color kDefaultForgetPassColor = Colors.grey;
final Color kFocusForgetPassColor = Colors.grey.shade600;
const IconData kDisableIconData = Icons.check_box_outline_blank_rounded;
const IconData kEnableIconData = Icons.check_box_rounded;
final Color kFacebookColor = Color(0xff3F67CA);
final Color kPhoneColor = Color(0xff62BB27);
final Color kGoogleColor = Colors.black;
final Color kSocialColor = Colors.grey.shade500;
final Color kMacColor = Colors.black.withOpacity(.7);
const Color kFilledTextFormFieldColor = Colors.grey;
const kErrorColor = Colors.red;
const Color kFilterCenterColor = Color.fromRGBO(255, 204, 128, 1);
const Color kFilterRightColor = Color.fromRGBO(206, 147, 216, 1);
const Color kFilterLeftColor = Color.fromRGBO(244, 143, 177, 1);
const Color kTitleDialogColor = Color(0xff00CA71);
const Color kDialogStateColor = Color(0xff00CA71);
const Color kDialogBorderColor = Colors.white;
const Color kDialogBackgroundColor = Colors.white;
const Color kDescriptionColor = Colors.grey;
Tuple2<IconData, Color> iconDataAndColorFun({required bool condition}) {
  IconData iconData;
  Color color;
  if (condition) {
    iconData = kEnableIconData;
    color = kFocusColor;
  } else {
    iconData = kDisableIconData;
    color = kDisableColor;
  }
  return Tuple2(iconData, color);
}

DialogType dialogType({required final String type}) {
  switch (type) {
    case 'success':
      return DialogType.success;
    case 'error':
      return DialogType.error;
    case 'info':
      return DialogType.info;
    case 'infoReverse':
      return DialogType.infoReverse;
    case 'noHeader':
      return DialogType.noHeader;
    case 'question':
      return DialogType.question;
    case 'warning':
      return DialogType.warning;
    default:
      return DialogType.success;
  }
}
