import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/auth_widgets/tab_bar_section.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_big_icon.dart';
import 'filter_section.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FilterSection(), // Fixed background
        const CustomBigIcon(
          iconData: Icons.lock,
        ),
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarSection(
                    tabController: tabController,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
