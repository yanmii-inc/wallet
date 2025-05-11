import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/domain/enums/auth_status.dart';
import 'package:yanmii_wallet/src/common/services/auth_service.dart';
import 'package:yanmii_wallet/src/features/auth/logout/logout_button.dart';
import 'package:yanmii_wallet/src/features/auth/presentation/sign_in/sign_in_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(
      authServiceProvider.select((auth) => auth.authStatus),
    );

    return FutureBuilder<AuthStatus>(
      future: authStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == AuthStatus.authenticated) {
          return Scaffold(
            appBar: AppBar(title: const Text('Settings')),
            body: const Center(child: LogoutButton()),
          );
        }

        return const SignInScreen();
      },
    );
  }
}
