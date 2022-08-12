import 'package:equatable/equatable.dart';

abstract class StatementEvent extends Equatable {
  const StatementEvent();

  @override
  List<Object?> get props => [];
}

class FetchStatement extends StatementEvent {
  final int offset;
  const FetchStatement(this.offset);
}
