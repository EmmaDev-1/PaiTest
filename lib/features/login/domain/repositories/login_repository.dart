import '../models/login.dart';

abstract class LoginRepository {
  Future<void> signIn(LoginParams params);
  Future<void> signInWithGoogle();
}
