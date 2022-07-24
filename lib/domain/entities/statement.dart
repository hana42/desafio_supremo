import 'package:equatable/equatable.dart';

class Statement extends Equatable {
  const Statement({
    required this.createdAt,
    required this.id,
    required this.amount,
    this.to,
    required this.description,
    required this.tType,
    this.from,
    this.bankName,
  });

  final DateTime createdAt;
  final String id;
  final int amount;
  final String? to;
  final String description;
  final String tType;
  final String? from;
  final String? bankName;

  @override
  List<Object?> get props =>
      [createdAt, id, amount, to, description, tType, from, bankName];
}
