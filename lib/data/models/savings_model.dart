import 'package:equatable/equatable.dart';
import 'package:desafio_supremo/domain/entities/savings.dart';

class SavingsModel extends Equatable {
  const SavingsModel({required this.amount});

  final int amount;

  SavingsModel copyWith({required int amount}) => SavingsModel(amount: amount);

  factory SavingsModel.fromJson(Map<String, dynamic> json) =>
      SavingsModel(amount: json['amount']);

  Map<String, dynamic> toJson() => {'amount': amount};

  Savings toEntity() => Savings(amount: amount);

  @override
  List<Object?> get props => [amount];
}
