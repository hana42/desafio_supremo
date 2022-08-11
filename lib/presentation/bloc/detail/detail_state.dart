part of 'detail_bloc.dart';

enum DetailStatus { initial, success, failure }

class DetailState extends Equatable {
  const DetailState({this.detail, this.status = DetailStatus.initial});

  final Detail? detail;
  final DetailStatus status;

  DetailState copyWith({
    DetailStatus? status,
    Detail? detail,
  }) {
    return DetailState(
      detail: detail ?? this.detail,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [];
}
