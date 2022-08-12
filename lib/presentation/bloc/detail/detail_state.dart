import 'package:equatable/equatable.dart';

import '../../../domain/entities/detail.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object?> get props => [];
}

class DetailEmpty extends DetailState {}

class DetailLoading extends DetailState {}

class DetailError extends DetailState {
  final String message;

  const DetailError(this.message);

  @override
  List<Object?> get props => [message];
}

class DetailHasData extends DetailState {
  final Detail result;

  const DetailHasData(this.result);

  @override
  List<Object?> get props => [result];
}
