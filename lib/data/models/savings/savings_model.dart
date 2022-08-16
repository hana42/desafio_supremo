import 'package:equatable/equatable.dart';

import '../../../domain/entities/savings.dart';

class SavingsModel extends Equatable {
  const SavingsModel({required this.amount});
  
  factory SavingsModel.fromJson(Map<String, dynamic> json) {
    return SavingsModel(amount: json['amount']);
  }

  final int amount;

  SavingsModel copyWith({required int amount}) => SavingsModel(amount: amount);

  Map<String, dynamic> toJson() => {'amount': amount};

  Savings toEntity() => Savings(amount: amount);

  @override
  List<Object?> get props => [amount];
}
