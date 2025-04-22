import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/user_source.dart';
import '../../data/models/user.dart';

/// Provider for the GetUserInfo use case.
final getUserInfoProvider = Provider<GetUserInfo>((ref) {
  return GetUserInfo(UserRemoteDataSource());
});

/// Use case to fetch user information.
class GetUserInfo {
  final UserRemoteDataSource remoteDataSource;

  GetUserInfo(this.remoteDataSource);

  /// Calls the remote data source to fetch user data and returns a User entity.
  Future<User> call() async {
    final jsonData = await remoteDataSource.fetchUserData();
    return User.fromJson(jsonData);
  }
}
