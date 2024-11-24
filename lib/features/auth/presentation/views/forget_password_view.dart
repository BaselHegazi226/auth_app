import 'package:auth_with_firebase_application/core/utilities/app_get.dart';
import 'package:auth_with_firebase_application/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/manager/auth_manager/auth_bloc.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/forget_pass_widgets/forget_pass_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  static const id = '/forgetPasswordView';
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepo: AppGet.getIt.get<AuthRepoImpl>(),
      ),
      child: ForgetPasswordViewBody(),
    );
  }
}
