import 'package:auth_with_firebase_application/core/helper/const_variables.dart';
import 'package:auth_with_firebase_application/core/utilities/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/app_get.dart';
import '../../data/repos/auth_repo/auth_repo_impl.dart';
import '../manager/auth_manager/auth_bloc.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
  static String id = '/OtpView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOtpRightColor.withAlpha(245),
        title: Text(
          'OTP View',
          style: Styles.textStyleFun(
            color: Colors.white,
            size: 24,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthSocialBloc(
          authRepo: AppGet.getIt.get<AuthRepoImpl>(),
        ),
        child: OtpView(),
      ),
    );
  }
}
