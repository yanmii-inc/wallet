import 'package:flutter/material.dart';

import 'package:yanmii_wallet/src/utils/extensions/build_context_extension/theme_extension.dart';

class CommonButton extends StatelessWidget {
  factory CommonButton(
    String text, {
    required VoidCallback onPressed,
    Key? key,
    double? height,
    bool? isLoading,
    double? fontSize,
    bool? isDisabled,
  }) =>
      CommonButton._(
        text,
        key: key,
        onPressed: onPressed,
        height: height ?? 48,
        isDisabled: isDisabled ?? false,
        isLoading: isLoading ?? false,
        fontSize: fontSize,
      );

  const CommonButton._(
    this.text, {
    required this.onPressed,
    super.key,
    this.icon,
    this.height = 48,
    this.isLoading = false,
    this.fontSize = 16,
    this.isDisabled = false,
  });

  factory CommonButton.withIcon(
    String text, {
    required Widget icon,
    required VoidCallback onPressed,
    Key? key,
    double? height,
    bool? isLoading,
    double? fontSize,
    bool? isDisabled,
  }) =>
      CommonButton._(
        text,
        key: key,
        icon: icon,
        onPressed: onPressed,
        height: height ?? 48,
        isDisabled: isDisabled ?? false,
        isLoading: isLoading ?? false,
        fontSize: fontSize,
      );

  final Widget? icon;
  final double? height;
  final VoidCallback onPressed;
  final String text;
  final double? fontSize;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: icon == null
          ? ElevatedButton(
              onPressed: isDisabled || isLoading ? null : onPressed,
              child: isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : ButtonText(text),
            )
          : ElevatedButton.icon(
              onPressed: isDisabled || isLoading ? null : onPressed,
              icon: icon,
              label: isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : ButtonText(text),
            ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.theme.textTheme.labelMedium,
    );
  }
}
