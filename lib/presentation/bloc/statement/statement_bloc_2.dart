import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/presentation/bloc/statement/statement_state.dart';

import '../../../domain/usecases/get_statement.dart';
import 'statement_event.dart';

class StatementBloc extends Bloc<StatementEvent, StatementState> {
  final GetStatement _getStatement;

  final limit = '10';

  StatementBloc(this._getStatement) : super(const StatementState()) {
    on<FetchStatement>((event, emit) async {
      if (state.hasReachedMax) return;
      try {
        if (state.states == States.empty) {
          emit(const StatementState(states: States.loading));
          print(state.offset.toString());
          final statements =
              await _getStatement.get(limit, state.offset.toString());
          statements.fold(
            (failure) {
              emit(const StatementState(states: States.error));
            },
            (data) {
              emit(StatementState(
                states: States.success,
                statement: data,
                hasReachedMax: false,
                offset: state.offset + 1,
              ));
            },
          );
        }
        final statements =
            await _getStatement.get(limit, state.offset.toString());
        statements.fold(
          (failure) {
            emit(const StatementState(states: States.error));
          },
          (data) {
            emit(data.isEmpty
                ? state.copyWith(hasReachedMax: true)
                : StatementState(
                    offset: state.offset + 1,
                    states: States.success,
                    hasReachedMax: false,
                    statement: List.of(state.statement)..addAll(data)));
          },
        );
        print(state.offset);
      } catch (_) {
        emit(state.copyWith(states: States.error));
      }
    });
  }
}
