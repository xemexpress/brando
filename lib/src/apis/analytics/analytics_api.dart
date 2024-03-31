import 'package:brando/src/apis/analytics/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsAPI implements AnalyticsAPIInterface {
  AnalyticsAPI({required FirebaseAnalytics analytics}) : _analytics = analytics;

  final FirebaseAnalytics _analytics;

  @override
  Future<void> setCurrentScreen({required String pageName}) async {
    try {
      await _analytics.logScreenView(screenName: pageName);
    } catch (e) {
      print('Error setting current screen: $e');
    }
  }
}
