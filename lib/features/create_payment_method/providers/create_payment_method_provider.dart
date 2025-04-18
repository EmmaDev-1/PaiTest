// File: lib/features/create_payment_method/ui/providers/create_payment_method_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../payment_methods/data/models/patment_method.dart';
import '../domain/use_cases/create_payment_method.dart';

/// StateProvider to hold the current preview of the payment method.
/// We must provide *all* required constructor params here.
final paymentMethodPreviewProvider = StateProvider.autoDispose<PaymentMethod>((
  ref,
) {
  return PaymentMethod(
    id: 'tmp',
    cardHolderName: '',
    cardNumber: '',
    expirationDate: '',
    cvv: '',
    cardType: '',
    paymentNetwork: '',
    bankName: '',
    bankImage: '',
    cardBankTypeImage: '',
    isPrimary: false,
  );
});

/// FutureProvider that executes the createPaymentMethod use case.
final submitPaymentMethodProvider =
    FutureProvider.family<PaymentMethod, PaymentMethod>((ref, method) async {
      final usecase = ref.watch(createPaymentMethodProvider);
      return await usecase(method);
    });
