import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/error_object.dart';
import '../../../domain/entities/statement.dart';
import '../../../domain/usecases/statement/get_statement_impl.dart';

part 'statement_state.dart';

class StatementCubit extends Cubit<StatementState> {
  StatementCubit(this._getStatement) : super(const StatementInitial());
  final GetStatementImpl _getStatement;

  int page = 1;
  List<Statement> statements = <Statement>[];

  void getStatement() async {
    if (const StatementLoaded().hasReachedMax == true) return;

    final currentState = state;
    if (currentState is StatementLoaded) {
      statements = List.of(currentState.statements);
    }

    await _getStatement(10, page).then((newStatement) {
      page++;

      newStatement.fold(
        (failure) => emit(
            StatementError(ErrorObject.mapFailureToError(failure: failure))),
        (data) => data.isEmpty
            ? emit(StatementLoaded(statements: statements, hasReachedMax: true))
            : {
                statements..addAll(data),
                emit(StatementLoaded(statements: statements)),
              },
      );
    });
  }

  // }
}
