import 'package:desafio_supremo/domain/entities/goal.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class GoalModel extends Equatable {
  final String title;
  final String? description;
  final double goal;
  bool completed;

  GoalModel(this.title, this.description, this.goal, {this.completed = false});

  GoalModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        goal = json['goal'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'goal': goal,
        'completed': completed,
      };

  Goal toEntity() => Goal(title, description, goal, completed: completed);

  @override
  List<Object?> get props => [title, description, goal, completed];
}
