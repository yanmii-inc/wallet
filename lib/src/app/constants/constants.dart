// * themes
import 'dart:ui';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

export '../themes/themes.dart';
// * enums
export 'enums/enums.dart';
// * keys
export 'keys/extras_key.dart';
export 'keys/hive_key.dart';

class AppConstants {
  const AppConstants._();

  // config
  static const env = 'ENV';
  static const envDev = 'DEV';
  static const envStg = 'STG';
  static const envProd = 'PROD';

  // translation
  static const translationsAssetPath = 'assets/translations';
  static const id = 'id';
  static const en = 'en';
  static const localeID = Locale(id, 'ID');
  static const localeEN = Locale(en, 'US');
  static const langID = 'lang_ID';
  static const langEN = 'lang_EN';

  // size
  static const double kMobileScreenWidth = 390;
  static const double kMobileScreenHeight = 844;

  static final idrCurrencyFormatter = CurrencyTextInputFormatter.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  );
}
