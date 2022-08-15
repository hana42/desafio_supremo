import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../../entities/savings.dart';

abstract class GetSavings {
  Future<Either<Failure, Savings>> call();
}
