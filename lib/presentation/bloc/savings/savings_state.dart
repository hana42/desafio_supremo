part of 'savings_cubit.dart';

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

class SavingsSuccess extends SavingsState {
  final Savings amount;
  const SavingsSuccess(this.amount);

  @override
  List<Object?> get props => [amount];
}
