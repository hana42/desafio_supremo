import 'package:formz/formz.dart';

///errros de validação para ConfirmedPassword].
enum ConfirmedPasswordValidationError {
  /// generic error
  invalid
}


///senha confirmada.

class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {

  const ConfirmedPassword.pure({this.password = ''}) : super.pure('');


  const ConfirmedPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  /// senha original
  final String password;

  @override
  ConfirmedPasswordValidationError? validator(String? value) {
    return password == value ? null : ConfirmedPasswordValidationError.invalid;
  }
}