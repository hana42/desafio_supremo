import 'package:equatable/equatable.dart';

import 'package:desafio_supremo/domain/entities/balance.dart';

class BalanceModel extends Equatable {
  const BalanceModel({required this.amount});

  final int amount;

  BalanceModel copyWith({required int amount}) => BalanceModel(amount: amount);

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      BalanceModel(amount: json['amount']);

  Map<String, dynamic> toJson() => {'amount': amount};

  Balance toEntity() => Balance(amount: amount);

  @override
  List<Object?> get props => [amount];
}
