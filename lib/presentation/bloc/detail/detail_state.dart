part of 'detail_cubit.dart';

class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object?> get props => [];
}

class DetailInitial extends DetailState {
  const DetailInitial();

  @override
  List<Object?> get props => [];
}

class DetailError extends DetailState {
  const DetailError(this.failure);
  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class DetailSuccess extends DetailState {
  const DetailSuccess(this.detail);
  final Detail detail;

  @override
  List<Object?> get props => [detail];
}
