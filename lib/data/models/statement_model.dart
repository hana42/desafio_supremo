import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'package:desafio_supremo/domain/entities/statement.dart';

class StatementModel extends Equatable {
  const StatementModel({
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

  StatementModel copyWith({
    required DateTime createdAt,
    required String id,
    required int amount,
    String? to,
    required String description,
    required String tType,
    String? from,
    String? bankName,
  }) =>
      StatementModel(
        createdAt: createdAt,
        id: id,
        amount: amount,
        to: to,
        description: description,
        tType: tType,
        from: from,
        bankName: bankName,
      );

  factory StatementModel.fromJson(Map<String, dynamic> json) => StatementModel(
        createdAt: DateTime.parse(json['createdAt']),
        id: json['id'],
        amount: json['amount'],
        to: json['to'],
        description: json['description'],
        tType: json['tType'],
        from: json['from'],
        bankName: json['bankName'],
      );

  Map<String, dynamic> toJson() => {
        'createdAt': DateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'").format(createdAt),
        'id': id,
        'amount': amount,
        'to': to,
        'description': description,
        'tType': tType,
        'from': from,
        'bankName': bankName,
      };

  Statement toEntity() => Statement(
        createdAt: createdAt,
        id: id,
        amount: amount,
        to: to,
        description: description,
        tType: tType,
        from: from,
        bankName: bankName,
      );

  @override
  List<Object?> get props =>
      [createdAt, id, amount, to, description, tType, from, bankName];
}
