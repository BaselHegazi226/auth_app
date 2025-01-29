import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_with_phone_num_widgets/sign_in_with_phone_num_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/app_get.dart';
import '../../../../core/utilities/text_styles.dart';
import '../../data/repos/auth_repo/auth_repo_impl.dart';
import '../manager/auth_manager/auth_bloc.dart';

class SignInPhoneNumView extends StatelessWidget {
  static String id = '/signInPhoneNumView';
  const SignInPhoneNumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(144, 238, 144, 1).withOpacity(.1),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Phone Number Sign In',
          style: Styles.textStyleFun(
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthSocialBloc(
          authRepo: AppGet.getIt.get<AuthRepoImpl>(),
        ),
        child: SignInWithPhoneNumViewBody(),
      ),
    );
  }
}
