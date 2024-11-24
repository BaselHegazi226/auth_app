import 'package:flutter/material.dart';

import '../../sign_in_view.dart';
import '../../sing_up_view.dart';
import 'custom_tab_bar.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({
    super.key,
    required this.tabController,
  });
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.6,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: CustomTabBar(
                tabController: tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  SignInView(),
                  SignUpView(),
                  //SignUpView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
