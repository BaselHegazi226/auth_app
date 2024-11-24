import 'package:auth_with_firebase_application/core/utilities/app_get.dart';
import 'package:auth_with_firebase_application/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/auth_manager/auth_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const id = '/signInView';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authRepo: AppGet.getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthSocialBloc(
            authRepo: AppGet.getIt.get<AuthRepoImpl>(),
          ),
        ),
      ],
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SignInViewBody(),
      ),
    );
  }
}
