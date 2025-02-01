import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/widgets/auth_widgets/filter_section.dart';
import 'const_variables.dart';

class ConstFunctions {
  static Tuple2<IconData, Color> iconDataAndColorFun(
      {required bool condition}) {
    IconData iconData;
    Color color;
    if (condition) {
      iconData = kEnableIconData;
      color = kEmailFocusColor;
    } else {
      iconData = kDisableIconData;
      color = kDisableColor;
    }
    return Tuple2(iconData, color);
  }

  static DialogType dialogType({required final String type}) {
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

//return enable color if the condition true else disable color
  static Color colorBackFun({required bool condition, required String word}) {
    return condition ? colorByWordFun(word: word) : kDisableColor;
  }

  static Color colorByWordFun({required String word}) {
    Color backcolor = Colors.white;
    switch (word) {
      case 'phone':
        backcolor = kPhoneFocusColor;
        break;
      case 'email':
        backcolor = kEmailFocusColor;
        break;
      case 'password':
        backcolor = kPasswordFocusColor;
        break;
    }
    return backcolor;
  }

  FilterSection filterSectionBackFun({required String method}) {
    Map<String, dynamic> map = {
      'google': FilterSection(
        leftColor: kGoogleFilterLeftColor,
        rightColor: kGoogleFilterRightColor,
        centerColor: kGoogleFilterCenterColor,
      ),
      'gmail': FilterSection(),
      'facebook': FilterSection(
        leftColor: kFacebookFilterLeftColor,
        rightColor: kFacebookFilterRightColor,
        centerColor: kFacebookFilterCenterColor,
      ),
    };
    return map[method];
  }
}
