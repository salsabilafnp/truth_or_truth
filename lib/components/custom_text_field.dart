import 'package:flutter/material.dart';
import 'package:truth_or_truth/utils/const.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String inputLabel;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool autoFocus;
  final bool obscureText;
  final bool readOnly;
  final String? hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.inputLabel,
    this.onChanged,
    this.onTap,
    this.autoFocus = false,
    this.obscureText = false,
    this.readOnly = false,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Sizes.s15),
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        readOnly: readOnly,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: inputLabel,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
