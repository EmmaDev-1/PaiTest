import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/colors.dart';
import '../../../widgets/app_scafold.dart';
import '../data/models/subscription.dart';
import '../data/models/user.dart';
import 'content/dashboard_appbar.dart';
import 'content/dashboard_body_content.dart';
import '../providers/subscription_provider.dart';
import '../providers/user_provider.dart';

/// DashboardScreen now obtains user and subscription data from simulated API calls.
/// It builds an AppBar with the user's data and passes the subscription info to the body.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch both user and subscription providers.
    final AsyncValue<User> userAsync = ref.watch(userProvider);
    final AsyncValue<Subscription> subscriptionAsync = ref.watch(
      subscriptionProvider,
    );

    // Combine the async values to build the screen when both have data.
    return userAsync.when(
      data:
          (user) => subscriptionAsync.when(
            data: (subscription) {
              return AppScaffold(
                isScrollable: true,
                appBar: DashboardAppBar(
                  userName: user.name,
                  profileImageUrl: user.profileImageUrl,
                  userEmail: user.email,
                ),
                body: DashboardBodyContent(subscription: subscription),
              );
            },
            error:
                (error, stackTrace) => Scaffold(
                  body: Center(
                    child: Text('Error loading subscription data: $error'),
                  ),
                ),
            loading:
                () => const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
          ),
      error:
          (error, stackTrace) => Scaffold(
            body: Center(child: Text('Error loading user data: $error')),
          ),
      loading:
          () => AppScaffold(
            backgroundColor: AppColors.white,
            isScrollable: false,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.accent),
            ),
          ),
    );
  }
}
