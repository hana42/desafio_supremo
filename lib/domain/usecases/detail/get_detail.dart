import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../../entities/detail.dart';

abstract class GetDetail {
  Future<Either<Failure, Detail>> call(String id);
}
