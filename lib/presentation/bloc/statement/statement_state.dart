part of 'statement_cubit.dart';

class StatementState extends Equatable {
  const StatementState();

  @override
  List<Object?> get props => [];
}

class StatementInitial extends StatementState {
  const StatementInitial();

  @override
  List<Object?> get props => [];
}

class StatementError extends StatementState {
  const StatementError(this.failure);
  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class StatementSuccess extends StatementState {
  const StatementSuccess({
    this.statements = const <Statement>[],
    this.hasReachedMax = false,
  });

  final List<Statement> statements;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [statements, hasReachedMax];
}
