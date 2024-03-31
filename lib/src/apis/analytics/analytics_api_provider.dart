import 'package:brando/src/apis/analytics/analytics.dart';
import 'package:brando/src/core/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsAPIProvider = Provider<AnalyticsAPI>((ref) {
  final firebaseAnalytics = ref.watch(firebaseAnalyticsProvider);

  return AnalyticsAPI(analytics: firebaseAnalytics);
});
