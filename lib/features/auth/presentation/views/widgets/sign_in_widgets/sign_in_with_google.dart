import 'package:auth_with_firebase_application/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utilities/AssetsData.dart';
import '../../../../../../core/utilities/custom_icon_button.dart';
import '../../../../../../core/utilities/show_snack_bar.dart';
import '../../../../../home/presentation/views/home_view.dart';
import '../../../manager/auth_manager/auth_bloc.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({
    super.key,
    required this.isEnableGoogleButton,
  });
  static const id = '/signInWithGoogle';
  final bool isEnableGoogleButton;
  @override
  Widget build(BuildContext context) {
    //print('google loading:$isEnableGoogle');
    return BlocConsumer<AuthSocialBloc, AuthStates>(
      listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          showSnackBar(
            context,
            'Sign in with google account success',
            kGoogleColor,
          );
          GoRouter.of(context).push(HomeView.id, extra: id);
        } else if (state is SignInWithGoogleFailure) {
          showSnackBar(context, state.errorMessage, kErrorColor);
        }
      },
      builder: (context, state) {
        return CustomIconButton(
          textColor: kGoogleColor,
          imageColor: kGoogleColor,
          image: AssetsData.kGoogleImage,
          errorLoadImage: AssetsData.kGoogleOfflineImage,
          onPressed: isEnableGoogleButton
              ? () {
                  BlocProvider.of<AuthSocialBloc>(context)
                      .add(SignInWithGoogleEvent());
                }
              : null,
          title: 'Google',
        );
      },
    );
  }
}
