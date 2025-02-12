// ignore_for_file: comment_references
import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  /// Use this extension to tagging the hardcoded text
  String get hardcoded => this;

  /// Use this extension to get [DateTime] from a string
  DateTime? get toDateTime => DateTime.tryParse(this);

  /// Use this extension to trim a string from List<String>
  /// Example :
  /// ["A", "B", "C"] -> toString() -> "[ABC]"
  /// ["A", "B", "C"] -> toString() -> "[ABC]" -> trimList -> "ABC"
  String get trimList => replaceAll('[', '').replaceAll(']', '');

  String get thousand {
    final formatter = NumberFormat('#,##,###');
    return formatter.format(int.parse(replaceAll(',', '')));
  }

  double? get thousandToDouble => double.tryParse(replaceAll(',', ''));

  String get toKebabCase {
    final exp = RegExp('(?<=[a-z])[A-Z]');
    return replaceAllMapped(exp, (Match m) => '-${m.group(0)}').toLowerCase();
  }
}
