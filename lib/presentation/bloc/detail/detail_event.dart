import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchDetail extends DetailEvent {
  final String id;
  const FetchDetail(this.id);
}
