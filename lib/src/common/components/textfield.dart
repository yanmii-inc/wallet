// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final List<TextInputFormatter>? inputFormatters;

  final TextInputType inputType;

  final void Function(String value)? onChanged;

  final FormFieldValidator<String>? validator;

  final VoidCallback? onFocusLost;

  const CommonTextfield({
    required this.label,
    super.key,
    this.controller,
    this.value,
    this.focusNode,
    this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.suffixIcon,
    this.inputType = TextInputType.text,
    this.validator,
    this.onEditingComplete,
    this.onFocusLost,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          onFocusLost?.call();
        }
      },
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: inputType,
        validator: validator,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        initialValue: value,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: suffixIcon,
        ),
        onTap: onTap,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
