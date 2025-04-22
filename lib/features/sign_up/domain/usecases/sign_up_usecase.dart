import '../models/sign_up.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _repo;
  SignUpUseCase(this._repo);

  Future<void> call(SignUpParams params) => _repo.signUp(params);
}
