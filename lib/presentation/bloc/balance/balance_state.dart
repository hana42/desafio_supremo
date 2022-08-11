// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../domain/entities/balance.dart';

abstract class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object?> get props => [];
}

class BalanceInitial extends BalanceState {}

class BalanceError extends BalanceState {
  final String message;
  const BalanceError(this.message);

  @override
  List<Object?> get props => [message];
}

class BalanceHasData extends BalanceState {
  final Balance result;
  final bool isVisible;
  const BalanceHasData(this.result, {this.isVisible = true});

  @override
  List<Object?> get props => [result];
}
