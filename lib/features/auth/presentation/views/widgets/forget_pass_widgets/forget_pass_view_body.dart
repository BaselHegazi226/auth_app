import 'package:auth_with_firebase_application/core/utilities/custom_circle_indicator.dart';
import 'package:auth_with_firebase_application/core/utilities/dialogState.dart';
import 'package:auth_with_firebase_application/core/utilities/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../../../../../../core/utilities/text_styles.dart';
import '../../../manager/auth_manager/auth_bloc.dart';
import '../verify_email_widgets/custom_text.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  bool isLoading = false;
  @override
  void initState() {
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEmailFocusColor,
        title: CustomText(
          text: 'Forget password',
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
            Icon(
              Icons.password,
              size: 80,
              color: kEmailFocusColor,
            ),
            const SizedBox(height: 32),
            Text(
              maxLines: 1,
              'Enter your email To reset password',
              style: Styles.textStyleFun(
                color: kEmailFocusColor,
                size: 22,
              ),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Email',
              focusNode: _emailFocusNode,
              textEditingController: _emailController,
              keyboardType: TextInputType.text,
              prefixIcon: Icon(
                Icons.email,
                color:
                    _emailFocusNode.hasFocus ? kEmailFocusColor : kDisableColor,
              ),
              textColor:
                  _emailFocusNode.hasFocus ? kEmailFocusColor : kDisableColor,
            ),
            const SizedBox(height: 16),
            BlocConsumer<AuthBloc, AuthStates>(
              listener: (context, state) {
                if (state is ForgetPasswordSuccess) {
                  successStateFun(context);
                } else if (state is ForgetPasswordFailure) {
                  failureStateFun(context, state);
                } else {
                  setState(() {
                    isLoading = true;
                  });
                }
              },
              builder: (context, state) {
                return CustomTextButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          BlocProvider.of<AuthBloc>(context).add(
                            ForgetPasswordEvent(
                              email: _emailController.text.trim(),
                            ),
                          );
                        },
                  backgroundColor: kEmailFocusColor,
                  shadowColor: kEmailFocusColor.withOpacity(.3),
                  child: isLoading
                      ? CustomCircleIndicator()
                      : CustomTitle(title: 'Reset Password'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void failureStateFun(BuildContext context, ForgetPasswordFailure state) {
    setState(() {
      isLoading = false;
    });
    showSnackBar(context, state.errorMessage, kErrorColor);
  }

  void successStateFun(BuildContext context) {
    setState(() {
      isLoading = false;
    });
    customAwesomeDialog(
        context: context,
        title: 'Success Found Email',
        description: 'Check Inbox To Reset Your Password',
        dialogState: 'success',
        onCancelPressed: () {},
        onSuccessPressed: () {
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
          showSnackBar(context, 'Sign in with new password',
              kEmailFocusColor.withOpacity(.4));
        });
  }
}
