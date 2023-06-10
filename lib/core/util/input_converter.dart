import 'package:dartz/dartz.dart';

import '../error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    final integer = int.tryParse(str);
    
    if (integer == null || integer < 0) {
      return Left(InvalidInputFailure());
    }

    return Right(integer);
  }
}

class InvalidInputFailure extends Failure {}
