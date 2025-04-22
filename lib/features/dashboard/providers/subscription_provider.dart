import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/subscription.dart';
import '../domain/use_cases/get_subscription_info.dart';

/// Provider to manage the state of subscription information.
final subscriptionProvider = FutureProvider<Subscription>((ref) async {
  final getSubscriptionInfo = ref.watch(getSubscriptionInfoProvider);
  return getSubscriptionInfo();
});
