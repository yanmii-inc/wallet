import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:yanmii_wallet/src/common/domain/entities/user.dart';
import 'package:yanmii_wallet/src/common/domain/enums/auth_status.dart';
import 'package:yanmii_wallet/src/utils/helpers/supabase_helper.dart';

class AuthRepository {
  AuthRepository();

  supabase.SupabaseClient get _client => SupabaseHelper.client;

  User? get currentUser {
    final session = _client.auth.currentSession;
    if (session == null) return null;

    final supaUser = _client.auth.currentUser;
    if (supaUser == null) return null;

    return User(
      uid: supaUser.id,
      email: supaUser.email ?? '',
      fullName: supaUser.userMetadata?['full_name'] as String?,
    );
  }

  Future<String?> get userToken async {
    final session = _client.auth.currentSession;
    return session?.accessToken;
  }

  Future<AuthStatus> get authStatus async {
    final token = await userToken;
    return token != null
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
  }

  Future<User> signIn(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) throw Exception('User not found');

      return User(
        uid: user.id,
        email: user.email ?? '',
        fullName: user.userMetadata?['full_name'] as String?,
      );
    } catch (e) {
      log('Sign in error:', error: e);
      log('Error type: ${e.runtimeType}');
      if (e is supabase.AuthException) {
        log('Auth error message: ${e.message}');
        log('Auth error status: ${e.statusCode}');
        throw Exception(e.message);
      }
      throw Exception('Failed to sign in. Please try again later.');
    }
  }

  Future<User> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    log('signUp $email $password $fullName');
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
      );

      final user = response.user;
      if (user == null) throw Exception('Failed to create user');

      return User(
        uid: user.id,
        email: user.email ?? '',
        fullName: fullName,
      );
    } catch (e, st) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: st);
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  Future<void> resendConfirmationEmail(String email) async {
    try {
      await _client.auth.resend(email: email, type: supabase.OtpType.signup);
    } catch (e) {
      log('Resend confirmation email error:', error: e);
      throw Exception('Failed to resend confirmation email. Please try again later.');
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
