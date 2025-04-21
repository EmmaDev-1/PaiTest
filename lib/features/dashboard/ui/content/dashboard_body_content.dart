import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/widgets/components/gaps.dart';
import '../../../../widgets/components/buttons/simple_button.dart';
import '../../data/models/subscription.dart';
import 'payment_info_card.dart';
import 'subscription_status_card.dart';

/// DashboardBodyContent receives the subscription data as a parameter and displays it.
class DashboardBodyContent extends StatelessWidget {
  final Subscription subscription;

  const DashboardBodyContent({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            // Card for displaying subscription status
            SubscriptionStatusCard(
              subscriptionStatus: subscription.subscriptionStatus,
              subscriptionName: subscription.subscriptionName,
              nextPaymentDate: subscription.nextPaymentDate,
            ),
            // Card for displaying next payment information
            PaymentInfoCard(
              nextPaymentDate: subscription.nextPaymentDate,
              paymentAmount: subscription.paymentAmount,
              paymentHistory: subscription.paymentHistory,
            ),
          ],
        ),
      ],
    );
  }
}
