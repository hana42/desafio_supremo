import '../../domain/entities/user.dart';
import '../../domain/services/authentication.dart';
import '../../domain/entities/user.dart';

class SignInUseCase {
  AuthenticationService authenticationService;

  SignInUseCase(this.authenticationService);

  Future<User> call(String email, String password) async {
    return await authenticationService.signIn(email, password);
  }
}