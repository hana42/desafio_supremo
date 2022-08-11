import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:desafio_supremo/domain/entities/statement.dart';
import 'package:desafio_supremo/domain/usecases/get_statement.dart';

part 'statement_state.dart';

class StatementCubit extends Cubit<StatementState> {
  StatementCubit(this._getStatement) : super(const StatementInitial());

  final GetStatement _getStatement;
  int page = 1;
  List<Statement> statements = <Statement>[];

  void fetchStatement() async {
    if (const StatementLoaded().hasReachedMax == true) return;

    final currentState = state;
    if (currentState is StatementLoaded) {
      statements = List.of(currentState.statements);
    }

    await _getStatement.get(10, page).then((newStatement) {
      page++;

      newStatement.fold(
        (left) => emit(const StatementError()),
        (right) => right.isEmpty
            ? emit(StatementLoaded(statements: statements, hasReachedMax: true))
            : {
                statements..addAll(right),
                emit(StatementLoaded(statements: statements)),
              },
      );
    });
  }

  // }
}
