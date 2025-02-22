part of 'routes.dart';

enum Routes {
  onboarding,
  splash,
  login,
  register,
  transactionsAdd,
  transactionsEdit,
  walletsAdd,
  detailedReport,
  ;

  String get path => '/${name.toKebabCase}';

  String get subPath => name.toKebabCase;
}

enum MainTabRoute {
  transactions,
  wallets,
  report,
  loans,
  settings,
  ;

  String get path {
    return '/${name.toKebabCase}';
  }

  Widget get icon {
    switch (this) {
      case transactions:
        return const Icon(Icons.home);
      case wallets:
        return const Icon(Icons.list);
      case report:
        return const Icon(Icons.search);
      case loans:
        return const Icon(Icons.history);
      case settings:
        return const Icon(Icons.person);
    }
  }

  String get label => name.toUpperCase();
}
