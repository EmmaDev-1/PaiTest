import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_repository_impl.dart';
import '../data/firebase_auth_data.dart';
import '../domain/models/sign_up.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/sign_up_usecase.dart';

/// DataSource
final firebaseAuthRemoteDSProvider = Provider(
  (_) => FirebaseAuthRemoteDataSource(FirebaseAuth.instance),
);

/// Repo
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(firebaseAuthRemoteDSProvider)),
);

/// UseCase
final signUpUseCaseProvider = Provider(
  (ref) => SignUpUseCase(ref.watch(authRepositoryProvider)),
);

/// StateNotifier para el estado de sign‑up
final signUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, AsyncValue<void>>(
      (ref) => SignUpNotifier(ref.watch(signUpUseCaseProvider)),
    );

class SignUpNotifier extends StateNotifier<AsyncValue<void>> {
  final SignUpUseCase _signUp;
  SignUpNotifier(this._signUp) : super(const AsyncData(null));

  Future<void> signUp(SignUpParams params) async {
    state = const AsyncLoading();
    try {
      await _signUp(params);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
