import 'package:equatable/equatable.dart';

import '../../../domain/entities/balance.dart';

abstract class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object?> get props => [];
}

class BalanceEmpty extends BalanceState {}

class BalanceLoading extends BalanceState {}

class BalanceError extends BalanceState {
  final String message;
  const BalanceError(this.message);

  @override
  List<Object?> get props => [message];
}

class BalanceHasData extends BalanceState {
  final Balance result;
  const BalanceHasData(this.result);

  @override
  List<Object?> get props => [result];
}
