import '../domain/models/login.dart';
import '../domain/repositories/login_repository.dart';
import 'firebase_auth_data.dart';

class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuthRemoteDataSource _remote;
  LoginRepositoryImpl(this._remote);

  @override
  Future<void> signIn(LoginParams params) async {
    await _remote.signIn(params);
  }

  @override
  Future<void> signInWithGoogle() async {
    await _remote.signInWithGoogle();
  }
}
