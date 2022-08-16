import 'package:equatable/equatable.dart';

import 'failure.dart';

class ErrorObject extends Equatable {
  const ErrorObject({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object?> get props => [title, message];

  static ErrorObject mapFailureToError({required Failure failure}) {
    if (failure is ServerFailure) {
      return const ErrorObject(
        title: 'Erro: INTERNAL_SERVER_FAILURE',
        message:
            'Parece que o servidor não está acessível no momento, tente novamente mais tarde. '
            'Se o problema persistir, entre em contato com o desenvolvedor em suporte@nobank.com',
      );
    } else if (failure is DataParsingFailure) {
      return const ErrorObject(
        title: 'Erro: PARSING_FAILURE',
        message:
            'Parece que o aplicativo precisa ser atualizado para refletir a estrutura de dados do servidor alterada. '
            'Se nenhuma atualização estiver disponível na loja, entre em contato com o desenvolvedor em suporte@nobank.com,',
      );
    } else if (failure is ConnectionFailure) {
      return const ErrorObject(
        title: 'Erro: NO_CONNECTION',
        message:
            'Parece que seu dispositivo não está conectado à rede, verifique sua conectividade com a Internet ou tente novamente mais tarde.',
      );
    } else {
      return const ErrorObject(
        title: 'Erro: UNKOWN',
        message: 'Estamos com problemas, tente novamente mais tarde.',
      );
    }
  }
}
