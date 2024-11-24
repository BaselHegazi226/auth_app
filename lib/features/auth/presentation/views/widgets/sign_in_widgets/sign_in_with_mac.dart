import 'package:auth_with_firebase_application/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utilities/AssetsData.dart';
import '../../../../../../core/utilities/custom_icon_button.dart';
import '../../../../../../core/utilities/show_snack_bar.dart';
import '../../../../../home/presentation/views/home_view.dart';
import '../../../manager/auth_manager/auth_bloc.dart';

class SignInWithMac extends StatelessWidget {
  const SignInWithMac({super.key});
  static const id = '/signInWithMac';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSocialBloc, AuthStates>(
      listener: (context, state) {
        if (state is SignInWithMacSuccess) {
          showSnackBar(
            context,
            'Sign in with mac account success',
            kMacColor,
          );
          GoRouter.of(context).push(HomeView.id, extra: id);
        } else if (state is SignInWithMacFailure) {
          showSnackBar(context, state.errorMessage, kErrorColor);
          print(state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomIconButton(
          textColor: kMacColor,
          image: AssetsData.kMacImage,
          errorLoadImage: AssetsData.kMacOfflineImage,
          onPressed: () {
            BlocProvider.of<AuthSocialBloc>(context).add(SignInWithMacEvent());
          },
          title: 'Mac',
        );
      },
    );
  }
}
