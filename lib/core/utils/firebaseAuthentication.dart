import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/exceptions/exception.dart';
import '../../domain/factories/user.dart';
import '../../domain/services/authentication.dart';
import '../../domain/entities/user.dart'as UserEntity;
import 'package:desafio_supremo/domain/exceptions/exception.dart';

class FirebaseAuthentication implements AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserEntity.User> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return UserFactory.createUser(email, userCredential.user?.displayName);
    } catch (e) {

      throw UserNotFound(e.toString());
    }
  }
}