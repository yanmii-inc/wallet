// ignore_for_file: lines_longer_than_80_chars

class SupabaseConfig {
  static const String url = 'https://cnlshmxfjfjrzxataauj.supabase.co';
  static const String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNubHNobXhmamZqcnp4YXRhYXVqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY0NDA2MDksImV4cCI6MjA2MjAxNjYwOX0.0PHGqOWKMxAo9R6AkQCoo7eNHqsZiEWwgdJdk5m_rBc';
  
  // Deep linking configuration
  static const String scheme = 'yanmiiwallet';
  static const String host = 'login-callback';
  
  // This will result in: yanmiiwallet://login-callback
  static String get redirectUrl => '$scheme://$host';
}
