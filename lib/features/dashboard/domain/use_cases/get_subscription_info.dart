import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/subscription_source.dart';
import '../../data/models/subscription.dart';

/// Provider for the GetSubscriptionInfo use case.
final getSubscriptionInfoProvider = Provider<GetSubscriptionInfo>((ref) {
  return GetSubscriptionInfo(SubscriptionRemoteDataSource());
});

/// Use case to fetch subscription information.
class GetSubscriptionInfo {
  final SubscriptionRemoteDataSource remoteDataSource;

  GetSubscriptionInfo(this.remoteDataSource);

  /// Calls the remote data source to fetch data and returns a Subscription entity.
  Future<Subscription> call() async {
    final jsonData = await remoteDataSource.fetchSubscriptionData();
    return Subscription.fromJson(jsonData);
  }
}
