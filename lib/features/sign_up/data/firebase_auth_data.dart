import 'package:firebase_auth/firebase_auth.dart';

import '../domain/models/sign_up.dart';

class FirebaseAuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthRemoteDataSource(this._firebaseAuth);

  Future<UserCredential> signUp(SignUpParams params) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}
