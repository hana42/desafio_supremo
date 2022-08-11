part of 'goals_bloc.dart';

abstract class SavingsEvent extends Equatable {
  const SavingsEvent();

  @override
  List<Object> get props => [];
}

class AddSavings extends SavingsEvent {
  final String todoTitle;

  const AddSavings(this.todoTitle);

  @override
  List<Object> get props => [todoTitle];
}

class RemoveSavings extends SavingsEvent {
  final String title;

  const RemoveSavings(this.title);

  @override
  List<Object> get props => [title];
}

class UpdateSavingsState extends SavingsEvent {
  final bool isCompleted;
  final String title;

  const UpdateSavingsState(this.isCompleted, this.title);

  @override
  List<Object> get props => [isCompleted];
}