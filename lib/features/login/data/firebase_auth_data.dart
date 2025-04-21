import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../domain/models/login.dart';

class FirebaseAuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthRemoteDataSource(this._firebaseAuth, this._googleSignIn);

  Future<UserCredential> signIn(LoginParams params) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }

  /// Nuevo método para Google Sign‑In
  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) throw Exception('Google sign‑in aborted');
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return _firebaseAuth.signInWithCredential(credential);
  }
}
