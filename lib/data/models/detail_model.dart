import 'package:desafio_supremo/domain/entities/detail.dart';
import 'package:equatable/equatable.dart';

class DetailModel extends Equatable {
  const DetailModel({
    required this.amount,
    required this.id,
    required this.authentication,
    required this.tType,
    required this.createdAt,
    this.to,
    this.from,
    required this.description,
  });

  final int amount;
  final String id;
  final String authentication;
  final String tType;
  final DateTime createdAt;
  final String? to;
  final String? from;
  final String description;

  DetailModel copyWith({
    required int amount,
    required String id,
    required String authentication,
    required String tType,
    required DateTime createdAt,
    String? to,
    String? from,
    required String description,
  }) =>
      DetailModel(
        amount: amount,
        id: id,
        authentication: authentication,
        tType: tType,
        createdAt: createdAt,
        to: to,
        from: from,
        description: description,
      );

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        amount: json['amount'],
        id: json['id'],
        authentication: json['authentication'],
        tType: json['tType'],
        createdAt: DateTime.parse(json['createdAt']),
        to: json['to'],
        from: json['from'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'id': id,
        'authentication': authentication,
        'tType': tType,
        'createdAt': createdAt.toLocal(),
        'to': to,
        'from': from,
        'description': description,
      };

  Detail toEntity() => Detail(
        amount: amount,
        id: id,
        authentication: authentication,
        tType: tType,
        createdAt: createdAt,
        to: to,
        from: from,
        description: description,
      );

  @override
  List<Object?> get props =>
      [amount, id, authentication, tType, createdAt, to, from, description];
}
