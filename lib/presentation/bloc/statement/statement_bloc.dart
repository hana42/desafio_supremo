import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/domain/usecases/get_statement.dart';
import 'package:desafio_supremo/presentation/bloc/statement/statement_event.dart';
import 'package:desafio_supremo/presentation/bloc/statement/statement_state.dart';

class StatementBloc extends Bloc<StatementEvent, StatementState> {
  final GetStatement _getStatement;

  StatementBloc(this._getStatement) : super(StatementEmpty()) {
    on<FetchStatement>((event, emit) async {
      if (state is StatementEmpty) {
        final result = await _getStatement.get(event.offset.toString());

        result.fold(
          (failure) {
            emit(StatementError(failure.message));
          },
          (data) {
            data.isEmpty
                ? emit(const StatementHasData(hasReachedMax: true))
                : emit(StatementHasData(statement: data));
          },
        );
      }
      final result = await _getStatement.get(event.offset.toString());

      result.fold(
        (failure) {
          emit(StatementError(failure.message));
        },
        (data) {
          data.isEmpty
              ? emit(const StatementHasData(hasReachedMax: true))
              : emit(StatementHasData(
                  statement: List.of(state.statements)..addAll(data)));
        },
      );
    });
  }
}
