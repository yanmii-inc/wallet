import 'package:firebase_analytics/firebase_analytics.dart';

enum AnalyticsEvent {
  exception,
  network,
}

class AnalyticsService {
  AnalyticsService._();
  static final AnalyticsService _singleton = AnalyticsService._();

  static FirebaseAnalyticsObserver get instance => _singleton._instance;

  late final FirebaseAnalyticsObserver _instance;

  static Future<void> init() async => _singleton._instance =
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);

  static void logNetwork(String data) => instance.analytics.logEvent(
        name: AnalyticsEvent.network.name.toUpperCase(),
        parameters: <String, String>{'data': data},
      );

  static void logException(String data) => instance.analytics.logEvent(
        name: AnalyticsEvent.exception.name.toUpperCase(),
        parameters: <String, String>{'data': data},
      );
}
