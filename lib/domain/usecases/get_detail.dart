import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/detail.dart';
import '../repositories/detail_repository.dart';

class GetDetail {
  final DetailRepository repository;
  GetDetail(this.repository);

  Future<Either<Failure, Detail>> execute(String id) {
    return repository.getDetail(id);
  }
}
