import 'package:equatable/equatable.dart';

import '../../../domain/entities/statement.dart';

enum States { empty, loading, error, success }

class StatementState extends Equatable {
  final States states;
  final List<Statement> statement;
  final bool hasReachedMax;
  final int offset;

  const StatementState(
      {this.states = States.empty,
      this.statement = const [],
      this.hasReachedMax = false,
      this.offset = 1});

  StatementState copyWith({
    States? states,
    List<Statement>? statement,
    bool? hasReachedMax,
    int? offset,
  }) {
    return StatementState(
        states: states ?? this.states,
        statement: statement ?? this.statement,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        offset: offset ?? this.offset);
  }

  @override
  List<Object?> get props => [states, statement, hasReachedMax];
}

// abstract class StatementState extends Equatable {
//   final List<Statement> statements;

//   const StatementState({this.statements = const <Statement>[]});
//   // final bool hasReachedMax;
//   // final int offset;

//   // const StatementState({
//   //   this.statements = const [],
//   //   this.hasReachedMax = false,
//   //   this.offset = 1,
//   // });

//   @override
//   List<Object?> get props => [statements];
// }

// class StatementEmpty extends StatementState {
//   const StatementEmpty();

//   @override
//   List<Object?> get props => [];
// }

// class StatementLoading extends StatementState {
//   const StatementLoading();
// }

// class StatementError extends StatementState {
//   final String message;
//   const StatementError(this.message);

//   @override
//   List<Object?> get props => [message];
// }

// class StatementHasData extends StatementState {
//   final List<Statement> result;
//   final bool hasReachedMax;
//   final int offset;
//   const StatementHasData(this.result, this.hasReachedMax, this.offset);

//   @override
//   List<Object?> get props => [result, hasReachedMax, offset];
// }
