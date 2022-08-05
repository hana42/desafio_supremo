import '../entities/user.dart';
import '../services/authentication.dart';

class UserFactory {
  static User createUser(email, name) {
    return new User(email, name);
  }
}