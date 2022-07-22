import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/detail.dart';

abstract class DetailRepository {
  Future<Either<Failure, Detail>> getDetail(String id);
}
