import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/detail.dart';

class DetailModel extends Equatable {
  const DetailModel({
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

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      amount: json['amount'] as int,
      id: json['id'] as String,
      authentication: json['authentication'] as String,
      tType: json['tType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      to: json['to'],
      from: json['from'],
      bankName: json['bankName'],
      description: json['description'] as String,
    );
  }

  final int amount;
  final String id;
  final String authentication;
  final String tType;
  final DateTime createdAt;
  final String? to;
  final String? from;
  final String? bankName;
  final String description;

  DetailModel copyWith({
    required int amount,
    required String id,
    required String authentication,
    required String tType,
    required DateTime createdAt,
    String? to,
    String? from,
    String? bankName,
    required String description,
  }) {
    return DetailModel(
      amount: amount,
      id: id,
      authentication: authentication,
      tType: tType,
      createdAt: createdAt,
      to: to,
      from: from,
      bankName: bankName,
      description: description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'id': id,
      'authentication': authentication,
      'tType': tType,
      'createdAt': DateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'").format(createdAt),
      'to': to,
      'from': from,
      'bankName': bankName,
      'description': description,
    };
  }

  Detail toEntity() {
    return Detail(
      amount: amount,
      id: id,
      authentication: authentication,
      tType: tType,
      createdAt: createdAt,
      to: to,
      from: from,
      bankName: bankName,
      description: description,
    );
  }

  @override
  List<Object?> get props => [
        amount,
        id,
        authentication,
        tType,
        createdAt,
        to,
        from,
        bankName,
        description,
      ];
}
