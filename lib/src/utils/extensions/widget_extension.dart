import 'package:flutter/material.dart';

const _kDefaultBodyPadding = 16.0;

extension WidgetExtension on Widget {
  Widget get withDefaultPadding => Padding(
        padding: const EdgeInsets.all(_kDefaultBodyPadding),
        child: this,
      );

  Widget get expand => Expanded(
        child: this,
      );
}
