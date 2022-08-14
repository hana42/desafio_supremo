import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../../entities/detail.dart';
import '../../repositories/detail_repository.dart';

class GetDetail {
  GetDetail(this._repository);
  final DetailRepository _repository;

  Future<Either<Failure, Detail>> call(String id) {
    return _repository(id); 
  }
}
