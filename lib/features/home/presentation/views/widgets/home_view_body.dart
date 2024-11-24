import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/constant.dart';
import '../../../../../core/utilities/custom_big_icon.dart';
import '../../../../auth/presentation/views/widgets/auth_widgets/filter_section.dart';
import 'home_view_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String navigateFrom = GoRouterState.of(context).extra as String;
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
