import 'package:equatable/equatable.dart';

class Detail extends Equatable {
  const Detail({
    required this.amount,
    required this.id,
    required this.authentication,
    required this.tType,
    required this.createdAt,
    this.to,
    this.from,
    this.bankName,
    required this.description,
  });

  final int amount;
  final String id;
  final String authentication;
  final String tType;
  final DateTime createdAt;
  final String? to;
  final String? from;
  final String? bankName;
  final String description;

  @override
  List<Object?> get props =>
      [amount, id, authentication, tType, createdAt, to, from, bankName, description];
}
