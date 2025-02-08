// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? value;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final bool obscureText;

  final TextInputType inputType;

  final void Function(String value)? onChanged;

  final FormFieldValidator<String>? validator;

  const CommonTextfield({
    required this.label,
    super.key,
    this.controller,
    this.value,
    this.focusNode,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.suffixIcon,
    this.inputType = TextInputType.text,
    this.validator,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      initialValue: value,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
      ),
      onTap: onTap,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
