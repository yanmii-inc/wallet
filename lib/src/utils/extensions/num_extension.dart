import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

extension NumExtension on num {
  SizedBox get gapH => SizedBox(
        height: this as double,
      );

  SizedBox get gapW => SizedBox(
        width: this as double,
      );
}

extension IntExtension on double {
  String get toIdr {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return formatter.format(this);
  }

  String get toDecimal {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: '');
    return formatter.format(this);
  }
}
