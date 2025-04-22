import 'dart:async';
import 'dart:convert';

/// Simulates an API call to fetch subscription data.
class SubscriptionRemoteDataSource {
  Future<Map<String, dynamic>> fetchSubscriptionData() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulated JSON response for subscription data
    const jsonString = '''
    {
      "subscriptionName": "Premium",
      "subscriptionStatus": "Activa",
      "nextPaymentDate": "30-Abr-2025",
      "paymentAmount": "\$150.00",
      "paymentHistory": [
        {"date": "30-Mar-2025", "amount": "\$150.00"},
        {"date": "30-Feb-2025", "amount": "\$150.00"},
        {"date": "30-Ene-2025", "amount": "\$150.00"},
        {"date": "30-Dic-2024", "amount": "\$150.00"},
        {"date": "30-Nov-2024", "amount": "\$150.00"}
      ]
    }
    ''';

    // Parse and return the data as a Map
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}
