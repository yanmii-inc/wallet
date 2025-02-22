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
    this.backgroundColor,
    this.textColor,
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
    Color? backgroundColor,
    Color? textColor,
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
        backgroundColor: backgroundColor,
        textColor: textColor,
      );

  final Widget? icon;
  final double? height;
  final VoidCallback onPressed;
  final String text;
  final double? fontSize;
  final bool isDisabled;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: icon == null
          ? ElevatedButton(
              onPressed: isDisabled || isLoading ? null : onPressed,
              style: backgroundColor != null
                  ? ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(backgroundColor),
                    )
                  : null,
              child: isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : ButtonText(text, textColor: textColor),
            )
          : ElevatedButton.icon(
              style: backgroundColor != null
                  ? ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(backgroundColor),
                    )
                  : null,
              onPressed: isDisabled || isLoading ? null : onPressed,
              icon: icon,
              label: isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : ButtonText(
                      text,
                      textColor: textColor,
                    ),
            ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText(
    this.text, {
    super.key,
    this.textColor,
  });

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.theme.textTheme.labelMedium!.copyWith(color: textColor),
    );
  }
}
