part of 'goals_cubit.dart';

abstract class GoalState extends Equatable {
  const GoalState();

  @override
  List<Object> get props => [];
}

class GoalLoading extends GoalState {}

class GoalLoaded extends GoalState {
  final List<Goal> listOfGoal;

  const GoalLoaded(this.listOfGoal);

  Map<String, dynamic> toJson() {
    return {'goals': listOfGoal};
  }

  @override
  List<Object> get props => [listOfGoal];
}
