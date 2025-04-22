import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/user.dart';
import '../domain/use_cases/get_user_info.dart';

/// Provider to manage the state of user information.
final userProvider = FutureProvider<User>((ref) async {
  final getUserInfo = ref.watch(getUserInfoProvider);
  return await getUserInfo();
});
