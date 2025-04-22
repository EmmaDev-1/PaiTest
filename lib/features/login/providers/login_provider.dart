import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data/firebase_auth_data.dart';
import '../data/login_repository_impl.dart';
import '../domain/models/login.dart';
import '../domain/repositories/login_repository.dart';
import '../domain/usecases/google_sing_in_usecase.dart';
import '../domain/usecases/login_usecase.dart';

/// DataSource
final loginRemoteDSProvider = Provider(
  (ref) => FirebaseAuthRemoteDataSource(FirebaseAuth.instance, GoogleSignIn()),
);

// Repo
final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepositoryImpl(ref.watch(loginRemoteDSProvider)),
);

/// UseCases
final signInUseCaseProvider = Provider(
  (ref) => SignInUseCase(ref.watch(loginRepositoryProvider)),
);

final googleSignInUseCaseProvider = Provider(
  (ref) => GoogleSignInUseCase(ref.watch(loginRepositoryProvider)),
);

/// Notifiers
final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, AsyncValue<void>>(
      (ref) => SignInNotifier(ref.watch(signInUseCaseProvider)),
    );

class SignInNotifier extends StateNotifier<AsyncValue<void>> {
  final SignInUseCase _signIn;
  SignInNotifier(this._signIn) : super(const AsyncData(null));

  Future<void> signIn(LoginParams params) async {
    state = const AsyncLoading();
    try {
      await _signIn(params);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Nuevo notifier para Google
final googleSignInNotifierProvider =
    StateNotifierProvider<GoogleSignInNotifier, AsyncValue<void>>(
      (ref) => GoogleSignInNotifier(ref.watch(googleSignInUseCaseProvider)),
    );

class GoogleSignInNotifier extends StateNotifier<AsyncValue<void>> {
  final GoogleSignInUseCase _googleSignIn;
  GoogleSignInNotifier(this._googleSignIn) : super(const AsyncData(null));

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    try {
      await _googleSignIn();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
