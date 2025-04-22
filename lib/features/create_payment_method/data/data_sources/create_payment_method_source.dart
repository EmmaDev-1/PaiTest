import 'dart:async';

import '../../../payment_methods/data/models/patment_method.dart';

/// Simulates an API call that creates a new payment method.
/// Returns the created PaymentMethod after a delay.
class CreatePaymentMethodRemoteDataSource {
  Future<PaymentMethod> createPaymentMethod(PaymentMethod input) async {
    // In a real API call you'd send `input` and get back the created object.
    // Here we just echo it back as “created”.
    return input;
  }
}
