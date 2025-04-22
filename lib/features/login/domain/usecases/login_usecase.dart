import '../models/login.dart';
import '../repositories/login_repository.dart';

class SignInUseCase {
  final LoginRepository _repo;
  SignInUseCase(this._repo);

  Future<void> call(LoginParams params) {
    return _repo.signIn(params);
  }
}
