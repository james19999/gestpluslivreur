import 'package:flutter/material.dart';

class InputFild extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final TextEditingController controlle;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  const InputFild(
      {super.key,
      required this.icon,
      required this.hintText,
      required this.controlle,
      this.validator,
      this.obscureText = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlle,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(),
          ),
          isDense: true,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
