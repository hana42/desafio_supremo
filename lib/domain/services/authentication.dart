import '../entities/user.dart';
import '../../domain/services/authentication.dart';

abstract class AuthenticationService {
  Future<User> signIn(String email, String password);
}