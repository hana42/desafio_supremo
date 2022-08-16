import 'package:formz/formz.dart';

enum CpfError { invalid }

class Cpf extends FormzInput<String, CpfError> {
  const Cpf.pure() : super.pure('');
  const Cpf.dirty([super.value = '']) : super.dirty();

  static final RegExp _cpfRegExp = RegExp(
    r'^[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\-?[0-9]{2}',
  );

  @override
  CpfError? validator(String? value) {
    return _cpfRegExp.hasMatch(value ?? '') ? null : CpfError.invalid;
  }
}
