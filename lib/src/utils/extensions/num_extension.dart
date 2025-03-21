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

extension IntExtension on int {
  String get toIdr {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(this);
  }

  String toDecimal(BuildContext context) {
    final formatter = NumberFormat.currency(
      locale: context.locale.toLanguageTag(),
      symbol: '',
      decimalDigits: 0,
    );
    return formatter.format(this);
  }

  String toCompact(BuildContext context) {
    final formatter =
        NumberFormat.compact(locale: context.locale.toLanguageTag());
    return formatter.format(this);
  }
}
