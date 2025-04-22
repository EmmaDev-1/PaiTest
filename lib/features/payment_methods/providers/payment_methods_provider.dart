import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/patment_method.dart';
import '../domain/use_cases/get_payment_methods_info.dart';

/// Provider that manages the state of payment methods.
final paymentMethodsProvider = FutureProvider<List<PaymentMethod>>((ref) async {
  final getPaymentMethodsInfo = ref.watch(getPaymentMethodsInfoProvider);
  return await getPaymentMethodsInfo();
});
