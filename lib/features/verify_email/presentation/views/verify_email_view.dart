import 'package:auth_with_firebase_application/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/manager/auth_manager/auth_bloc.dart';
import 'package:auth_with_firebase_application/features/verify_email/presentation/views/widgets/verify_email_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailView extends StatelessWidget {
  static const id = '/verifyEmailView';
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepo: AuthRepoImpl(),
      ),
      child: VerifyEmailViewBody(),
    );
  }
}
