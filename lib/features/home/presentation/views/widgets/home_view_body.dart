import 'package:auth_with_firebase_application/core/helper/const_functions.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_with_facebook.dart';
import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/sign_in_widgets/sign_in_with_google.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/const_variables.dart';
import '../../../../../core/utilities/custom_big_icon.dart';
import '../../../../../core/utilities/dialogState.dart';
import 'home_view_button.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String navigateFrom = GoRouterState.of(context).extra as String;
      successAwesomeDialogInHome(navigateFrom: navigateFrom);
    });
  }

  void successAwesomeDialogInHome({required String navigateFrom}) {
    final signInMethods = {
      SignInWithFacebook.id: {
        'name': 'Facebook',
        'color': kFacebookColor,
      },
      SignInWithGoogle.id: {
        'name': 'Google',
        'color': kGoogleColor,
      },
    };

    final method = signInMethods[navigateFrom] ??
        {
          'name': 'Gmail',
          'color': kEmailFocusColor,
        };

    customAwesomeDialog(
      context: context,
      title: 'Success Sign In With ${method['name']}',
      description: 'Welcome to Home!',
      dialogState: 'success',
      // dialogBorderColor: method['color'] as Color,
      // dialogStateColor: method['color'] as Color,
      // titleColor: method['color'] as Color,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEmailFocusColor.withOpacity(.05),
        elevation: 2,
        title: Padding(
          padding: const EdgeInsets.only(top: 32),
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
            ConstFunctions.filterSectionBackFun(
              method: GoRouterState.of(context).extra as String,
            ),
            const CustomBigIcon(iconData: Icons.home_filled),
            Align(
              alignment: Alignment.center,
              child: HomeViewButton(
                navigateFrom: GoRouterState.of(context).extra as String,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
