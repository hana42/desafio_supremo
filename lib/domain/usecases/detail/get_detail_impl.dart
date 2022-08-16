import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../../entities/detail.dart';
import '../../repositories/detail/detail_repository.dart';

import 'get_detail.dart';

class GetDetailImpl implements GetDetail{
  GetDetailImpl(this._repository);
  final DetailRepository _repository;

  @override
  Future<Either<Failure, Detail>> call(String id) {
    return _repository(id); 
  }
}
