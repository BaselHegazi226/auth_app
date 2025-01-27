import 'package:auth_with_firebase_application/features/auth/presentation/manager/auth_manager/auth_bloc.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_with_phone_num_widgets/phone_number_view_text_section.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_with_phone_num_widgets/phone_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
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
  final AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
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
        listener: (context, state) {},
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
                    String phone = "+2${value!.trim()}";
                    if (phone.length != 13 && !phone.startsWith('+20')) {
                      return 'Invalid Number';
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
                      GoRouter.of(context).push(
                        OtpView.id,
                      );
                    }
                  },
                  backgroundColor: kPhoneLeftColor,
                  shadowColor: kPhoneLeftColor,
                  child: CustomTitle(
                    title: 'Verify Phone Number',
                  ),
                ),
              ],
            ),
          );
        });
  }
}
