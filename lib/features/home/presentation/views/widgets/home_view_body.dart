import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_with_facebook.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_with_google.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utilities/custom_big_icon.dart';
import '../../../../../core/utilities/dialogState.dart';
import '../../../../auth/presentation/views/widgets/auth_widgets/filter_section.dart';
import 'home_view_button.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void successAwesomeDialogInHome({required String successFrom}) {
    String successFrom = 'Gmail';
    switch (successFrom) {
      case SignInWithFacebook.id:
        successFrom = 'FaceBook';
      case SignInWithGoogle.id:
        successFrom = 'Google';
      default:
        successFrom = 'Gmail';
    }
    customAwesomeDialog(
      context: context,
      title: 'Success Sign In With $successFrom',
      description: 'Welcome to the Home!',
      dialogState: 'success',
      onCancelPressed: () {
        Navigator.of(context).pop(); // Close the dialog
      },
      onSuccessPressed: () {
        Navigator.of(context).pop(); // Close the dialog
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String navigateFrom = GoRouterState.of(context).extra as String;
    successAwesomeDialogInHome(successFrom: navigateFrom);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kFocusColor.withOpacity(.05),
        elevation: 2,
        title: Padding(
          padding: EdgeInsets.only(
            top: 32,
          ),
          child: Text(
            'Home View',
            style: TextStyle(
              color: ThemeData().colorScheme.surface,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: 'cairo',
            ),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const FilterSection(), // Fixed background
            const CustomBigIcon(iconData: Icons.home_filled),
            Align(
              alignment: Alignment.center,
              child: HomeViewButton(
                navigateFrom: navigateFrom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
