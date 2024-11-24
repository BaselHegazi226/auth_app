import 'package:auth_with_firebase_application/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/custom_circle_indicator.dart';
import '../../../../../core/utilities/custom_text_button.dart';
import '../../../../../core/utilities/custom_title.dart';
import '../../../../../core/utilities/show_snack_bar.dart';
import '../../../../auth/presentation/manager/auth_manager/auth_bloc.dart';

class VerifyEmailButton extends StatefulWidget {
  const VerifyEmailButton({super.key});

  @override
  State<VerifyEmailButton> createState() => _VerifyEmailButtonState();
}

class _VerifyEmailButtonState extends State<VerifyEmailButton> {
  bool isEnableButton = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is VerifyEmailSuccess) {
            showSnackBar(
              context,
              'verify success',
              Colors.brown.shade500,
            );
            setState(() {
              isEnableButton = true;
            });
          } else if (state is VerifyEmailFailure) {
            showSnackBar(
              context,
              state.errorMessage,
              kErrorColor,
            );
            setState(() {
              isEnableButton = true;
            });
          } else {
            setState(() {
              isEnableButton = false;
            });
          }
        },
        builder: (context, state) {
          return CustomTextButton(
            onPressed: isEnableButton
                ? () {
                    BlocProvider.of<AuthBloc>(context).add(VerifyEmailEvent());
                  }
                : null,
            backgroundColor: Colors.brown.shade400,
            shadowColor: Colors.brown.shade100,
            child: isEnableButton
                ? const CustomTitle(
                    buttonTitle: 'Verify',
                    size: 32,
                  )
                : CustomCircleIndicator(),
          );
        },
      ),
    );
  }
}
