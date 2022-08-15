import 'package:formz/formz.dart';

///erros de validação para name
enum NameError { invalid }

class Name extends FormzInput<String, NameError> {
  const Name.pure() : super.pure('');
  const Name.dirty([super.value = '']) : super.dirty();

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  NameError? validator(String? value) {
    return _nameRegExp.hasMatch(value ?? '') ? null : NameError.invalid;
  }
}
