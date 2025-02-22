import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get toDayDdMmYyyy => DateFormat(
        'EEEE, dd MMM yyyy',
      ).format(this);

  String get toMmmYyyy => DateFormat(
        'MMMM yyyy',
      ).format(this);

  String get toDdMmYyyy => DateFormat(
        'dd MMM yyyy',
      ).format(this);

  String get toHhMm => DateFormat('HH:mm').format(this);
}
