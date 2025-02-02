import 'package:flutter/widgets.dart';

extension NumExtension on num {
  SizedBox get gapH => SizedBox(
        height: this as double,
      );

  SizedBox get gapW => SizedBox(
        width: this as double,
      );
}
