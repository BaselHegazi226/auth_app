import 'package:auth_with_firebase_application/core/utilities/app_get.dart';
import 'package:auth_with_firebase_application/features/my_app/presentation/view/my_ap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/utilities/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppGet.setUp();
  runApp(const MyApp());
}

//
// class Counter extends StatefulWidget {
//   const Counter({super.key});
//
//   @override
//   State<Counter> createState() => _CounterState();
// }
//
// class _CounterState extends State<Counter> {
//   int counter = 30;
//   Timer? timer;
//   bool isButtonEnable = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // The counter function will only start when the button is pressed, so no need to call it here.
//   }
//
//   void counterFun() {
//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (counter > 0) {
//         setState(() {
//           counter--;
//         });
//       } else {
//         setState(() {
//           counter = 30;
//           isButtonEnable = false;
//         });
//         timer.cancel();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomTextButton(
//                 onPressed: !isButtonEnable
//                     ? () {
//                         if (!isButtonEnable) {
//                           setState(
//                             () {
//                               isButtonEnable = true;
//                               counterFun(); // Start the timer only when the button is pressed
//                             },
//                           );
//                         }
//                       }
//                     : null,
//                 backgroundColor: focusColor,
//                 shadowColor: focusColor.withOpacity(.8),
//                 child: CustomTitle(
//                   buttonTitle: 'Send Verification Code',
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 8,
//                 ),
//                 child: VisibilityVerificationMessage(
//                   isActiveButton: isButtonEnable,
//                   text: 'resend it through $counter Seconds',
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
