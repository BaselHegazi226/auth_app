import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utilities/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.white,
          onSurface: Colors.brown.shade500,
          primary: const Color.fromRGBO(206, 147, 216, 1),
          onPrimary: Colors.black,
          secondary: const Color.fromRGBO(244, 143, 177, 1),
          onSecondary: Colors.white,
          tertiary: const Color.fromRGBO(255, 204, 128, 1),
          error: Colors.redAccent,
          outline: const Color(0xff424242),
        ),
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
    );
  }
}
