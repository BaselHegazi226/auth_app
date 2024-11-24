import 'package:auth_with_firebase_application/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utilities/AssetsData.dart';
import '../../../../../../core/utilities/custom_icon_button.dart';
import '../../../../../../core/utilities/show_snack_bar.dart';
import '../../../../../home/presentation/views/home_view.dart';
import '../../../manager/auth_manager/auth_bloc.dart';

class SignInWithFacebook extends StatelessWidget {
  const SignInWithFacebook({
    super.key,
    required this.isEnableFacebookButton,
  });
  static const id = '/signInWithFacebook';
  final bool isEnableFacebookButton;
  @override
  Widget build(BuildContext context) {
    //print('facebook loading:$isEnableFacebook');
    return BlocConsumer<AuthSocialBloc, AuthStates>(
      listener: (context, state) {
        if (state is SignInWithFacebookSuccess) {
          showSnackBar(
            context,
            'Sign in with facebook account success',
            kFacebookColor,
          );
          GoRouter.of(context).push(
            HomeView.id,
            extra: id,
          );
        } else if (state is SignInWithFacebookFailure) {
          showSnackBar(
            context,
            state.errorMessage,
            kErrorColor,
          );
        }
      },
      builder: (context, state) {
        return CustomIconButton(
          textColor: kFacebookColor,
          imageColor: kFacebookColor,
          image: AssetsData.kFacebookImage,
          errorLoadImage: AssetsData.kFacebookOfflineImage,
          onPressed: isEnableFacebookButton
              ? () {
                  BlocProvider.of<AuthSocialBloc>(context)
                      .add(SignInWithFacebookEvent());
                }
              : null,
          title: 'Facebook',
        );
      },
    );
  }
}
