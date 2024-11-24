import 'package:auth_with_firebase_application/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/manager/auth_manager/auth_bloc.dart';
import 'package:auth_with_firebase_application/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/app_get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const id = '/homeView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepo: AppGet.getIt.get<AuthRepoImpl>(),
      ),
      child: HomeViewBody(),
    );
  }
}
