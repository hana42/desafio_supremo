part of 'statement_bloc.dart';

class StatementState extends Equatable {
  const StatementState();

  @override
  List<Object?> get props => [];
}

class StatementInitial extends StatementState {
  const StatementInitial();
}

class StatementError extends StatementState {
  const StatementError();
}

class StatementLoaded extends StatementState {
  const StatementLoaded({
    this.statements = const <Statement>[],
    this.hasReachedMax = false,
  });

  final List<Statement> statements;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [statements, hasReachedMax];
}
