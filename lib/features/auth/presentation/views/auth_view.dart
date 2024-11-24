import 'package:auth_with_firebase_application/features/auth/presentation/views/widgets/auth_widgets/auth_view_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});
  static const id = '/authView';
  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.top;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: keyboardHeight,
        ),
        child: AuthViewBody(
          tabController: tabController,
        ),
      ),
    );
  }
}
