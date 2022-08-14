import 'package:either_dart/either.dart';

import '../../core/error/failure.dart';
import '../entities/detail.dart';

abstract class DetailRepository {
  Future<Either<Failure, Detail>> call(String id);
}
