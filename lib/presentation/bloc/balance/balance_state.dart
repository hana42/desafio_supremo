
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
  const BalanceError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class BalanceSuccess extends BalanceState {
  const BalanceSuccess(this.balance);
  final Balance balance;

  @override
  List<Object?> get props => [balance];
}
