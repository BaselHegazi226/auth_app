import 'package:auth_with_firebase_application/core/utilities/custom_circle_indicator.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/manager/auth_manager/auth_bloc.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_with_phone_num_widgets/phone_number_view_text_section.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_with_phone_num_widgets/phone_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../../../../../../core/utilities/show_snack_bar.dart';
import '../../otp_view.dart';

class InputInfoSection extends StatefulWidget {
  const InputInfoSection({super.key});

  @override
  State<InputInfoSection> createState() => _InputInfoSectionState();
}

class _InputInfoSectionState extends State<InputInfoSection> {
  final TextEditingController phoneEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode phoneFocusNode = FocusNode();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isEnableButton = false;
  @override
  void initState() {
    phoneFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSocialBloc, AuthStates>(
      listener: (context, state) {
        if (state is SignInWithPhoneSuccess) {
          successStateFun(context, state);
        } else if (state is SignInWithPhoneFailure) {
          failureStateFun(state);
        } else {
          loadedStateFun();
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PhoneNumberViewTextSection(
                phoneFocusNode: phoneFocusNode,
              ),
              SizedBox(
                height: 16,
              ),
              PhoneTextFormField(
                phoneController: phoneEditingController,
                phoneFocusNode: phoneFocusNode,
                validator: (value) {
                  final RegExp egyptianPhoneRegex =
                      RegExp(r'^(010|011|012|015)[0-9]{8}$');
                  if (value!.isEmpty) {
                    return 'Phone number is required';
                  } else if (!egyptianPhoneRegex.hasMatch(value)) {
                    return 'Enter Correct Phone number';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 24,
              ),
              CustomTextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<AuthSocialBloc>(context).add(
                      SignInWithPhoneEvent(
                        phoneNumber: '+2${phoneEditingController.text.trim()}',
                      ),
                    );
                    FocusScope.of(context).unfocus();
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                  }
                },
                backgroundColor: kPhoneLeftColor,
                shadowColor: kPhoneLeftColor,
                child: isEnableButton
                    ? CustomCircleIndicator()
                    : CustomTitle(
                        title: 'Send',
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  void successStateFun(BuildContext context, SignInWithPhoneSuccess state) {
    GoRouter.of(context).push(
      OtpView.id,
      extra: state.verifyId,
    );
    showSnackBar(context, 'Success sign up ', kEmailFocusColor);
    onResetFun();
  }

  void onResetFun() {
    setState(() {
      autoValidateMode = AutovalidateMode.disabled;
      isEnableButton = true;
    });
  }

  void failureStateFun(SignInWithPhoneFailure state) {
    setState(
      () {
        isEnableButton = true;
        autoValidateMode =
            AutovalidateMode.always; // Trigger validation after an error
        _formKey.currentState?.validate(); // Trigger form re-validation
      },
    );
  }

  void loadedStateFun() {
    setState(() {
      isEnableButton = false;
    });
  }
}
