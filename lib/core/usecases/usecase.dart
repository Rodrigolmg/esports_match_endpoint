import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/error/failure.dart';

abstract class UseCase<T, P>{
  Future<Either<Failure, T>> call([P params]);
}