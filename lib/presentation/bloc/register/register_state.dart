part of 'register_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class RegisterState extends Equatable {
  const RegisterState({
    this.name = const Name.pure(),
    this.cpf = const Cpf.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final Name name;
  final Cpf cpf;
  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props =>
      [name, cpf, email, password, confirmedPassword, status];

  RegisterState copyWith({
    Name? name,
    Cpf? cpf,
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return RegisterState(
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}