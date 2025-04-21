import '../repositories/login_repository.dart';

class GoogleSignInUseCase {
  final LoginRepository _repo;
  GoogleSignInUseCase(this._repo);

  Future<void> call() => _repo.signInWithGoogle();
}
