part of 'goals_bloc.dart';

abstract class SavingsState extends Equatable {
  const SavingsState();

  @override
  List<Object> get props => [];
}

class SavingsLoading extends SavingsState {}

class SavingsLoaded extends SavingsState {
  final List<Savings> listOfSavings;

  const SavingsLoaded(this.listOfSavings);

  Map<String, dynamic> toJson() {
    return {'savings': listOfSavings};
  }

  @override
  List<Object> get props => [listOfSavings];
}
