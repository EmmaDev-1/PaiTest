import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/payment_methods_source.dart';
import '../../data/models/patment_method.dart';

/// Provider for the GetPaymentMethodsInfo use case.
final getPaymentMethodsInfoProvider = Provider<GetPaymentMethodsInfo>((ref) {
  return GetPaymentMethodsInfo(PaymentMethodsRemoteDataSource());
});

/// Use case that fetches payment methods and returns a list of PaymentMethod entities.
class GetPaymentMethodsInfo {
  final PaymentMethodsRemoteDataSource remoteDataSource;

  GetPaymentMethodsInfo(this.remoteDataSource);

  Future<List<PaymentMethod>> call() async {
    final jsonList = await remoteDataSource.fetchPaymentMethodsData();
    return jsonList.map((json) => PaymentMethod.fromJson(json)).toList();
  }
}
