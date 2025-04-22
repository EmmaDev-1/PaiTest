import '../models/sign_up.dart';

abstract class AuthRepository {
  Future<void> signUp(SignUpParams params);
}
