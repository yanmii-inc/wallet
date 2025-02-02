part of 'routes.dart';

enum Routes {
  onboarding,
  splash,
  login,
  register,
  main;

  String get path => '/${name.toKebabCase}';

  String get subPath => name.toKebabCase;
}

enum MainTabRoute {
  tab1,
  tab2,
  tab3,
  tab4,
  tab5,
  ;

  String get path {
    return '/${name.toKebabCase}';
  }

  Widget get icon {
    switch (this) {
      case tab1:
        return const Icon(Icons.home);
      case tab2:
        return const Icon(Icons.list);
      case tab3:
        return const Icon(Icons.search);
      case tab4:
        return const Icon(Icons.history);
      case tab5:
        return const Icon(Icons.person);
    }
  }

  String get label => name.toUpperCase();
}
