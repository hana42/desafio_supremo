part of 'savings_cubit.dart';

abstract class SavingsState extends Equatable {
  const SavingsState();

  @override
  List<Object?> get props => [];
}

class SavingsInitial extends SavingsState {}

class SavingsError extends SavingsState {
  const SavingsError(this.failure);
  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class SavingsSuccess extends SavingsState {
  const SavingsSuccess(this.amount);
  final Savings amount;

  @override
  List<Object?> get props => [amount];
}
