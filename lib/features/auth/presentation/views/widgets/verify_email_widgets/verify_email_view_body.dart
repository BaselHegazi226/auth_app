import 'dart:async';

import 'package:auth_with_firebase_application/core/helper/const_functions.dart';
import 'package:auth_with_firebase_application/core/helper/const_variables.dart';
import 'package:auth_with_firebase_application/core/utilities/custom_text_button.dart';
import 'package:auth_with_firebase_application/core/utilities/custom_title.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/verify_email_widgets/verifyMessage.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/verify_email_widgets/visibility_verification_message.dart';
import 'package:auth_with_firebase_application/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utilities/show_snack_bar.dart';
import '../../../../../../core/utilities/text_styles.dart';
import '../../../manager/auth_manager/auth_bloc.dart';
import 'custom_text.dart';

class VerifyEmailViewBody extends StatefulWidget {
  const VerifyEmailViewBody({super.key});

  @override
  State<VerifyEmailViewBody> createState() => _VerifyEmailViewBodyState();
}

class _VerifyEmailViewBodyState extends State<VerifyEmailViewBody> {
  Color verifyColor = kEmailFocusColor;
  int counter = 30;
  Timer? timer;
  bool isButtonEnabled = false;

  void counterFun() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        setState(() {
          counter = 30;
          isButtonEnabled = false;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: verifyColor,
        title: CustomText(
          text: 'Verify Email',
          textStyle: Styles.textStyleFun(
            color: Colors.white,
            size: 24,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 28,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Animation or Icon
            Icon(
              Icons.email_outlined,
              size: 80,
              color: verifyColor,
            ),
            const SizedBox(height: 16),
            BlocConsumer<AuthBloc, AuthStates>(listener: (context, state) {
              if (state is VerifyEmailSuccess) {
                successState(context);
              } else if (state is VerifyEmailFailure) {
                failureState(context, state);
              } else {
                loadedState();
              }
            }, builder: (context, state) {
              return CustomTextButton(
                onPressed: !isButtonEnabled
                    ? () {
                        BlocProvider.of<AuthBloc>(context).add(
                          VerifyEmailEvent(),
                        );
                        setState(
                          () {
                            isButtonEnabled = true;
                            counterFun(); // Start the timer only when the button is pressed
                          },
                        );
                      }
                    : null,
                backgroundColor: ConstFunctions.colorBackFun(
                  condition: isButtonEnabled,
                  word: 'email',
                ),
                shadowColor: kEmailFocusColor.withAlpha(128),
                child: CustomTitle(
                  title: 'Send Verification Link',
                ),
              );
            }),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: VisibilityVerificationMessage(
                isActiveButton: isButtonEnabled,
                child: counter > 0
                    ? VerifyMessage(
                        verifyMessage: 'resend it through $counter seconds',
                      )
                    : const SizedBox(),
              ),
            ),
            // const SizedBox(height: 30),
            // if (counter > 0 && isButtonEnabled) ...[
            //   Icon(
            //     Icons.check_circle,
            //     color: focusColor,
            //     size: 100,
            //   ),
            // ],
          ],
        ),
      ),
    );
  }

  void loadedState() {
    setState(() {
      isButtonEnabled = false;
    });
  }

  void failureState(BuildContext context, VerifyEmailFailure state) {
    setState(() {
      counter = 0;
      isButtonEnabled = true;
    });
    showSnackBar(
      context,
      state.errorMessage,
      kErrorColor,
    );
  }

  void successState(BuildContext context) {
    setState(() {
      isButtonEnabled = true;
    });
    showSnackBar(
      context,
      'Success real email enjoy!',
      verifyColor,
    );
    GoRouter.of(context).push(
      HomeView.id,
      extra: 'Gmail',
    );
  }
}
