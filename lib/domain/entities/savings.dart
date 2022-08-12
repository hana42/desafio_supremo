import 'package:equatable/equatable.dart';

class Savings extends Equatable {
  const Savings({required this.amount});

  final int amount;

  @override
  List<Object?> get props => [amount];
}
