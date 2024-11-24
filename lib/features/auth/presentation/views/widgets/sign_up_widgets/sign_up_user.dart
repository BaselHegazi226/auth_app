// import 'package:flutter/material.dart';
//
// import '../../../../../../core/utls/custom_text_form_field.dart';
//
// class UserNameField extends StatefulWidget {
//   const UserNameField({
//     super.key,
//     required this.color,
//     required this.personFocusNode,
//   });
//   final Color color;
//   final FocusNode personFocusNode;
//   @override
//   State<UserNameField> createState() => _UserNameFieldState();
// }
//
// class _UserNameFieldState extends State<UserNameField> {
//   final TextEditingController textEditingController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomTextFormField(
//       onSaved: (value) {},
//       // onTap: () {
//       //   FocusScope.of(context).requestFocus(widget.personFocusNode);
//       //   setState(() {});
//       // },
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Enter the user name';
//         } else if (value.length >= 30) {
//           return 'enter use name < 30 letters';
//         }
//         return null;
//       },
//       color: widget.color,
//       focusNode: widget.personFocusNode,
//       hintText: 'User Name',
//       textEditingController: textEditingController,
//       keyboardType: TextInputType.name,
//       prefixIcon: Icon(
//         Icons.person_rounded,
//         color: widget.color,
//       ),
//     );
//   }
// }
