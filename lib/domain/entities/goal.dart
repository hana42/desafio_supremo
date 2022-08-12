import 'package:equatable/equatable.dart';

class Goal extends Equatable {
  final String title;
  final String? description;
  final double goal;
  bool completed;

  Goal(this.title, this.description, this.goal, {this.completed = false});

  @override
  List<Object?> get props => [title, description, goal, completed];
}
