// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../domain/entities/statement.dart';

class StatementState extends Equatable {
  final List<Statement> statements;
  const StatementState({
    this.statements = const <Statement>[],
  });

  @override
  List<Object?> get props => [];
}

class StatementEmpty extends StatementState {}

class StatementError extends StatementState {
  final String message;
  const StatementError(this.message);

  @override
  List<Object?> get props => [message];
}

class StatementHasData extends StatementState {
  final List<Statement> statement;
  final bool hasReachedMax;

  const StatementHasData({
    this.statement = const <Statement>[],
    this.hasReachedMax = false,
  });

  StatementHasData copyWith({List<Statement>? statement, bool? hasReachedMax}) {
    return StatementHasData(
      statement: statement ?? this.statement,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [statement, hasReachedMax];
}
