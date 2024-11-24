import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
  });
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      unselectedLabelColor:
          Theme.of(context).colorScheme.onSurface.withOpacity(.5),
      labelColor: Theme.of(context).colorScheme.onSurface,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Theme.of(context).colorScheme.secondary,
      indicatorWeight: 3,
      dividerColor: Colors.transparent,
      tabs: const [
        Padding(
          padding: EdgeInsets.all(
            12,
          ),
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(
            12,
          ),
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
