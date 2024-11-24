import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_with_facebook.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_with_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utilities/custom_circle_indicator.dart';
import '../../../../../core/utilities/custom_text_button.dart';
import '../../../../../core/utilities/custom_title.dart';
import '../../../../../core/utilities/show_snack_bar.dart';
import '../../../../auth/presentation/manager/auth_manager/auth_bloc.dart';
import '../../../../auth/presentation/views/auth_view.dart';
import '../../../../auth/presentation/views/sign_in_view.dart';
import '../../../../auth/presentation/views/widgets/sign_in_widgets/sign_in_with_mac.dart';

class HomeViewButton extends StatefulWidget {
  const HomeViewButton({
    super.key,
    required this.navigateFrom,
  });
  final String navigateFrom;
  @override
  State<HomeViewButton> createState() => _HomeViewButtonState();
}

class _HomeViewButtonState extends State<HomeViewButton> {
  late Color color;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          showSnackBar(context, 'Sign out success', color);
          if (widget.navigateFrom == SignInView.id) {
            GoRouter.of(context).pop();
          } else {
            GoRouter.of(context).push(AuthView.id);
          }
        } else if (state is SignOutFailure) {
          showSnackBar(context, state.errorMessage, kErrorColor);
        }
      },
      builder: (context, state) {
        if (state is SignOutLoading) {
          return CustomCircleIndicator();
        }
        return CustomTextButton(
          backgroundColor: color,
          shadowColor: kFocusColor.withOpacity(.5),
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
          },
          child: state is SignOutLoading
              ? const CustomCircleIndicator()
              : const CustomTitle(
                  buttonTitle: 'Sign out',
                ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    determineColorFun();
  }

  void determineColorFun() {
    if (widget.navigateFrom == SignInWithGoogle.id) {
      color = kGoogleColor;
    } else if (widget.navigateFrom == SignInWithFacebook.id) {
      color = kFacebookColor;
    } else if (widget.navigateFrom == SignInWithMac.id) {
      color = kMacColor;
    } else {
      color = kFocusColor;
    }
  }
}
