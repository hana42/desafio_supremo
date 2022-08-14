import 'package:equatable/equatable.dart';

import '../../domain/entities/balance.dart';

class BalanceModel extends Equatable {

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      BalanceModel(amount: json['amount'] as int);
  const BalanceModel({required this.amount});

  final int amount;

  BalanceModel copyWith({required int amount}) => BalanceModel(amount: amount);

  Map<String, int> toJson() => {'amount': amount};

  Balance toEntity() => Balance(amount: amount);

  @override
  List<Object?> get props => [amount];
}
