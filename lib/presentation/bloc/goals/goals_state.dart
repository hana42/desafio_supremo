part of 'goals_cubit.dart';

abstract class GoalState extends Equatable {
  const GoalState();

  @override
  List<Object> get props => [];
}

class GoalLoading extends GoalState {}

class GoalLoaded extends GoalState {
  final List<GoalModel> goalsList;

  const GoalLoaded(this.goalsList);

  Map<String, dynamic> toJson() {
    return {'goals': goalsList};
  }

  @override
  List<Object> get props => [goalsList];
}
