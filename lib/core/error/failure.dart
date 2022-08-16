import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  const factory Failure.serverFailure() = ServerFailure;
  const factory Failure.dataParsingFailure() = DataParsingFailure;
  const factory Failure.cacheFailure() = CacheFailure;
  const factory Failure.connectionFailure() = ConnectionFailure;
  const factory Failure.unkownFailure() = UnkownFailure;
  
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure();
}

class DataParsingFailure extends Failure {
  const DataParsingFailure();
}

class CacheFailure extends Failure {
  const CacheFailure();
}

class ConnectionFailure extends Failure {
  const ConnectionFailure();
}

class UnkownFailure extends Failure {
  const UnkownFailure();
}