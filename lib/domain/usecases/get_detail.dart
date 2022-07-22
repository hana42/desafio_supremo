import 'package:either_dart/either.dart';

import '../../core/error/failure.dart';
import '../entities/detail.dart';
import '../repositories/detail_repository.dart';

class GetDetail {
  final DetailRepository repository;
  GetDetail(this.repository);

  Future<Either<Failure, Detail>> get(String id) {
    return repository.getDetail(id);
  }
}
