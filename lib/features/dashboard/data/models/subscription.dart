import 'payment.dart';

/// Entity representing subscription details.
class Subscription {
  final String subscriptionName;
  final String subscriptionStatus;
  final String nextPaymentDate;
  final String paymentAmount;
  final List<Payment> paymentHistory;

  Subscription({
    required this.subscriptionName,
    required this.subscriptionStatus,
    required this.nextPaymentDate,
    required this.paymentAmount,
    required this.paymentHistory,
  });

  /// Factory method to create a Subscription from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) {
    var historyList = json['paymentHistory'] as List<dynamic>;
    List<Payment> payments =
        historyList
            .map((e) => Payment.fromJson(e as Map<String, dynamic>))
            .toList();

    return Subscription(
      subscriptionName: json['subscriptionName'] as String,
      subscriptionStatus: json['subscriptionStatus'] as String,
      nextPaymentDate: json['nextPaymentDate'] as String,
      paymentAmount: json['paymentAmount'] as String,
      paymentHistory: payments,
    );
  }
}
