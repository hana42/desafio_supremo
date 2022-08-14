import 'package:equatable/equatable.dart';

import '../../domain/entities/savings.dart';

class SavingsModel extends Equatable {
  factory SavingsModel.fromJson(Map<String, dynamic> json) =>
      SavingsModel(amount: json['amount']);
  const SavingsModel({required this.amount});

  final int amount;

  SavingsModel copyWith({required int amount}) => SavingsModel(amount: amount);

  Map<String, dynamic> toJson() => {'amount': amount};

  Savings toEntity() => Savings(amount: amount);

  @override
  List<Object?> get props => [amount];
}
