import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/presentation/bloc/statement/statement_state.dart';

import '../../../domain/usecases/get_statement.dart';
import 'statement_event.dart';

class StatementBloc extends Bloc<StatementEvent, StatementState> {
  final GetStatement _getStatement;

  final limit = '10';
  int offset = 1;

  StatementBloc(this._getStatement) : super(const StatementEmpty()) {
    on<FetchStatement>((event, emit) async {
      bool reachedMax = false;
      if (reachedMax == false) {
        if (state is StatementEmpty) emit(const StatementLoading());
        final statements = await _getStatement.get(limit, offset.toString());
        statements.fold(
          (failure) {
            emit(StatementError(failure.message));
          },
          (data) {
            print(data.last.to ?? data.last.from);
            data == []
                ? reachedMax = true
                : emit(StatementHasData(data, false, offset));
          },
        );
        offset += 1;
        print('new $offset');
      }
    });
  }
}
