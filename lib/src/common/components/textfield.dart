// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yanmii_wallet/src/common/components/button.dart';
import 'package:yanmii_wallet/src/features/main/main_screen.dart';

class CommonTextfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final bool obscureText;

  final TextInputType inputType;

  final void Function(String value)? onChanged;

  final FormFieldValidator<String>? validator;

  const CommonTextfield({
    required this.label,
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.onChanged,
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
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
      ),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
