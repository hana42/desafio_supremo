import 'package:equatable/equatable.dart';

class Balance extends Equatable {
  const Balance({required this.amount});

  final int amount;

  Balance copyWith({required int amount}) => Balance(amount: amount);

  factory Balance.fromJson(Map<String, dynamic> json) =>
      Balance(amount: json['amount']);

  Map<String, dynamic> toJson() => {'amount': amount};

  Balance toEntity() => Balance(amount: amount);

  @override
  List<Object?> get props => [amount];
}
