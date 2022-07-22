import 'package:equatable/equatable.dart';

class DetailModel extends Equatable {
  const DetailModel({
    required this.amount,
    required this.id,
    required this.authentication,
    required this.tType,
    required this.createdAt,
    required this.to,
    required this.description,
  });

  final int amount;
  final String id;
  final String authentication;
  final String tType;
  final DateTime createdAt;
  final String? to;
  final String description;

  DetailModel copyWith({
    required int amount,
    required String id,
    required String authentication,
    required String tType,
    required DateTime createdAt,
    required String to,
    required String description,
  }) =>
      DetailModel(
        amount: amount,
        id: id,
        authentication: authentication,
        tType: tType,
        createdAt: createdAt,
        to: to,
        description: description,
      );

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        amount: json['amount'],
        id: json['id'],
        authentication: json['authentication'],
        tType: json['tType'],
        createdAt: DateTime.parse(json['createdAt']),
        to: json['to'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'id': id,
        'authentication': authentication,
        'tType': tType,
        'createdAt': createdAt.toIso8601String(),
        'to': to,
        'description': description,
      };

  DetailModel toEntity() => DetailModel(
        amount: amount,
        id: id,
        authentication: authentication,
        tType: tType,
        createdAt: createdAt,
        to: to,
        description: description,
      );

  @override
  List<Object?> get props =>
      [amount, id, authentication, tType, createdAt, to, description];
}
