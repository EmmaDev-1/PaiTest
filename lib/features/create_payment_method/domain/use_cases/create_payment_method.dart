import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../payment_methods/data/models/patment_method.dart';
import '../../data/data_sources/create_payment_method_source.dart';

/// Provider for the CreatePaymentMethod use case.
final createPaymentMethodProvider = Provider<CreatePaymentMethod>((ref) {
  return CreatePaymentMethod(CreatePaymentMethodRemoteDataSource());
});

/// Use case that calls the data source to create a new payment method.
class CreatePaymentMethod {
  final CreatePaymentMethodRemoteDataSource remoteDataSource;

  CreatePaymentMethod(this.remoteDataSource);

  /// Executes creation and returns the created PaymentMethod.
  Future<PaymentMethod> call(PaymentMethod paymentMethod) {
    return remoteDataSource.createPaymentMethod(paymentMethod);
  }
}
