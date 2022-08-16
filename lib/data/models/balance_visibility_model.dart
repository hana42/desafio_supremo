// ignore_for_file: sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class BalanceVisibilityModel extends Equatable {
  BalanceVisibilityModel(this.isVisible);

  final bool isVisible;

  @override
  List<Object?> get props => [isVisible];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isVisible': isVisible,
    };
  }

  factory BalanceVisibilityModel.fromMap(Map<String, dynamic> map) {
    return BalanceVisibilityModel(
      map['isVisible'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory BalanceVisibilityModel.fromJson(String source) =>
      BalanceVisibilityModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
