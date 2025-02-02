part of 'routes.dart';

enum Routes {
  onboarding,
  splash,
  login,
  register,
  transactions,
  transactionsAdd,
  main;

  String get path => '/${name.toKebabCase}';

  String get subPath => name.toKebabCase;
}

enum MainTabRoute {
  transactions,
  wallets,
  reports,
  loans,
  settings,
  ;

  String get path {
    return '/${name.toKebabCase}';
  }

  Widget get icon {
    switch (this) {
      case transactions:
        return const Icon(Icons.note);
      case wallets:
        return const Icon(Icons.wallet);
      case reports:
        return const Icon(Icons.report);
      case loans:
        return const Icon(Icons.document_scanner);
      case settings:
        return const Icon(Icons.settings);
    }
  }

  String get label => name.toUpperCase();
}
