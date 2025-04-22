import '../domain/models/sign_up.dart';
import '../domain/repositories/auth_repository.dart';
import 'firebase_auth_data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthRemoteDataSource _remote;
  AuthRepositoryImpl(this._remote);

  @override
  Future<void> signUp(SignUpParams params) async {
    final cred = await _remote.signUp(params);
    // await FirebaseFirestore.instance.collection('users')
    //   .doc(cred.user!.uid)
    //   .set({
    //     'username': params.username,
    //     'name': params.name,
    //     'phone': params.phone,
    //   });
  }
}
