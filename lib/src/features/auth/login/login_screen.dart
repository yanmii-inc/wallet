import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';
import 'package:yanmii_wallet/src/common/components/button.dart';
import 'package:yanmii_wallet/src/common/components/textfield.dart';
import 'package:yanmii_wallet/src/features/auth/login/login_controller.dart';
import 'package:yanmii_wallet/src/localization/locale_keys.g.dart';
import 'package:yanmii_wallet/src/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Key loginButton = const Key('login_button');
  static Key emailField = const Key('email_field');
  static Key passwordField = const Key('password_field');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: horizontalPadding,
        child: Column(
          children: [
            Gap.h16,
            LoginHeaderSection(),
            Gap.h16,
            Divider(
              thickness: 1,
              height: 0,
            ),
            Gap.h24,
            LoginInputSection(),
          ],
        ),
      ),
    );
  }
}

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => context.pushNamed(Routes.register.name),
        child: const Text('Register'),
      ),
    );
  }
}

class LoginInputSection extends ConsumerStatefulWidget {
  const LoginInputSection({
    super.key,
    this.isLoginAsResult = false,
  });

  final bool isLoginAsResult;

  @override
  ConsumerState<LoginInputSection> createState() => _LoginInputSectionState();
}

class _LoginInputSectionState extends ConsumerState<LoginInputSection> {
  bool isPasswordObscure = true;
  bool hasBiometric = true;

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    _listenAuth(context);

    final emailForm = ref.watch(loginControllerProvider).email;
    final passwordForm = ref.watch(loginControllerProvider).password;

    log('status ${ref.watch(loginControllerProvider).isValid}');

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextfield(
          key: LoginScreen.emailField,
          controller: _emailEditingController,
          hintText: tr(LocaleKeys.email),
          label: LocaleKeys.email.tr(),
          onChanged: (value) =>
              ref.read(loginControllerProvider.notifier).updateEmail(value),
          inputType: TextInputType.emailAddress,
          validator: (value) => emailForm.error?.message,
        ),
        Gap.h4,
        CommonTextfield(
          key: LoginScreen.passwordField,
          controller: _passwordEditingController,
          hintText: tr(LocaleKeys.password),
          label: LocaleKeys.password.tr(),
          obscureText: true,
          onChanged: (value) =>
              ref.read(loginControllerProvider.notifier).updatePassword(value),
          validator: (value) => passwordForm.error?.message,
        ),
        Gap.h4,
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: const Text('Forgot Password?'),
          ),
        ),
        Gap.h24,
        Row(
          children: [
            Expanded(
              child: CommonButton(
                'Login',
                key: LoginScreen.loginButton,
                isDisabled: ref.watch(loginControllerProvider).isValid,
                isLoading: ref.watch(loginControllerProvider).value.isLoading,
                onPressed: () => ref
                    .read(loginControllerProvider.notifier)
                    .submit(emailForm.value, passwordForm.value),
              ),
            ),
            Gap.w12,
            ElevatedButton(
              child: Icon(
                Icons.fingerprint,
                color:
                    Theme.of(context).extension<AppColors>()!.buttonTextColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  void _listenAuth(BuildContext context) {
    ref.listen(loginControllerProvider, (previous, next) {
      final justAuthenticated =
          next.submissionStatus == FormzSubmissionStatus.success;

      if (justAuthenticated) {
        context.goNamed(Routes.main.name);
      }
    });
  }
}
