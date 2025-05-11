import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yanmii_wallet/src/app/config/supabase_config.dart';

class SupabaseHelper {
  static const String _supabaseUrl = SupabaseConfig.url;
  static const String _supabaseAnonKey = SupabaseConfig.anonKey;

  static SupabaseClient? _client;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseAnonKey,
    );
    _client = Supabase.instance.client;
  }

  static SupabaseClient get client {
    if (_client == null) {
      throw Exception('Supabase client not initialized');
    }
    return _client!;
  }

  // Database methods
  Future<List<Map<String, dynamic>>> getWallets() async {
    final response = await client
        .from('wallets')
        .select()
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<Map<String, dynamic>> createWallet({
    required String name,
    String? logo,
  }) async {
    final response = await client
        .from('wallets')
        .insert({
          'name': name,
          'logo': logo,
        })
        .select()
        .single();
    return response;
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    final response = await client.from('transactions').select('''
          *,
          wallets (
            name,
            logo
          ),
          categories (
            label
          )
        ''').order('date', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<Map<String, dynamic>> createTransaction({
    required String date,
    required int walletId,
    required double amount,
    required String title,
    required String type,
    int? destWalletId,
    int? categoryId,
    String? description,
  }) async {
    final response = await client.from('transactions').insert({
      'date': date,
      'wallet_id': walletId,
      'dest_wallet_id': destWalletId,
      'amount': amount,
      'title': title,
      'category_id': categoryId,
      'description': description,
      'type': type,
    }).select('''
      *,
      wallets (
        name,
        logo
      ),
      categories (
        label
      )
    ''').single();
    return response;
  }

  Future<List<Map<String, dynamic>>> getLoans() async {
    final response = await client.from('loans').select('''
          *,
          wallets (
            name,
            logo
          )
        ''').order('date', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<Map<String, dynamic>> createLoan({
    required String date,
    required int walletId,
    required double amount,
    required String name,
    required String type,
    String? description,
  }) async {
    final response = await client.from('loans').insert({
      'date': date,
      'wallet_id': walletId,
      'amount': amount,
      'name': name,
      'description': description,
      'type': type,
    }).select('''
      *,
      wallets (
        name,
        logo
      )
    ''').single();
    return response;
  }

  Future<List<Map<String, dynamic>>> getLoanPayments(int loanId) async {
    final response = await client.from('loan_payments').select('''
          *,
          wallets (
            name,
            logo
          )
        ''').eq('loan_id', loanId).order('date', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<Map<String, dynamic>> createLoanPayment({
    required String date,
    required int walletId,
    required int loanId,
    required double amount,
    String? note,
  }) async {
    final response = await client.from('loan_payments').insert({
      'date': date,
      'wallet_id': walletId,
      'loan_id': loanId,
      'amount': amount,
      'note': note,
    }).select('''
      *,
      wallets (
        name,
        logo
      )
    ''').single();
    return response;
  }
}
