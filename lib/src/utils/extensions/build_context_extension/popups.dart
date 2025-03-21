import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yanmii_wallet/src/utils/extensions/string_extension.dart';

const kDialogDefaultKey = Key('dialog-default-key');

extension BuildContextEntension<T> on BuildContext {
  Future<T?> showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) =>
      showModalBottomSheet(
        context: this,
        barrierColor: barrierColor,
        isScrollControlled: isScrollControlled,
        backgroundColor: backgroundColor,
        builder: (context) => Wrap(children: [child]),
      );

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message,
  ) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );

  Future<bool?> showToast(String message) async => true;

  /// Generic function to show a platform-aware Material
  /// or Cupertino error dialog
  Future<bool?> showAlertDialog({
    required BuildContext context,
    required String title,
    String? content,
    String? cancelActionText,
    String defaultActionText = 'OK',
  }) async {
    if (kIsWeb || !Platform.isIOS) {
      return showDialog(
        context: context,
        barrierDismissible: cancelActionText != null,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: content != null ? Text(content) : null,
          actions: <Widget>[
            if (cancelActionText != null)
              TextButton(
                child: Text(cancelActionText),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            TextButton(
              key: kDialogDefaultKey,
              child: Text(defaultActionText),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      );
    }
    return showCupertinoDialog(
      context: context,
      barrierDismissible: cancelActionText != null,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          if (cancelActionText != null)
            CupertinoDialogAction(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          CupertinoDialogAction(
            key: kDialogDefaultKey,
            child: Text(defaultActionText),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }

  /// Generic function to show a platform-aware Material
  /// or Cupertino error dialog
  Future<void> showExceptionAlertDialog({
    required BuildContext context,
    required String title,
    required dynamic exception,
  }) =>
      showAlertDialog(
        context: this,
        title: title,
        content: exception.toString(),
        defaultActionText: 'OK'.hardcoded,
      );

  Future<void> showNotImplementedAlertDialog({required BuildContext context}) =>
      showAlertDialog(
        context: context,
        title: 'Not implemented'.hardcoded,
      );
}
