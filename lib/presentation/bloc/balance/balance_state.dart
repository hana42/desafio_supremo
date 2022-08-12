part of 'balance_cubit.dart';

abstract class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object?> get props => [];
}

class BalanceInitial extends BalanceState {
  const BalanceInitial();

  @override
  List<Object?> get props => [];
}

class BalanceError extends BalanceState {
  final String message;
  const BalanceError(this.message);

  @override
  List<Object?> get props => [message];
}

class BalanceSuccess extends BalanceState {
  final Balance balance;
  const BalanceSuccess(this.balance);

  @override
  List<Object?> get props => [balance];
}
