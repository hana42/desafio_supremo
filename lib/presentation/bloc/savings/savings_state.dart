import 'package:equatable/equatable.dart';

import 'package:desafio_supremo/domain/entities/balance.dart';

abstract class SavingsState extends Equatable {
  const SavingsState();

  @override
  List<Object?> get props => [];
}

class SavingsInitial extends SavingsState {}

class SavingsError extends SavingsState {
  final String message;
  const SavingsError(this.message);

  @override
  List<Object?> get props => [message];
}

class SavingsHasData extends SavingsState {
  final Balance result;
  final bool isVisible;
  const SavingsHasData(this.result, {this.isVisible = true});

  @override
  List<Object?> get props => [result];
}
