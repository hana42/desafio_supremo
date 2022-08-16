import 'package:equatable/equatable.dart';

import '../../../domain/entities/balance.dart';

class BalanceModel extends Equatable {
  const BalanceModel({required this.amount});

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(amount: json['amount'] as int);
  }

  final int amount;

  BalanceModel copyWith({required int amount}) => BalanceModel(amount: amount);

  Map<String, int> toJson() => {'amount': amount};

  Balance toEntity() => Balance(amount: amount);

  @override
  List<Object?> get props => [amount];
}
