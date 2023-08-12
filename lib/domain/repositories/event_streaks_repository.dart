import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/error/failure.dart';
import 'package:esports_match_endpoint/domain/entities/event_streak_entity.dart';

abstract class EventStreaksRepository{
  Future<Either<Failure, EventStreakEntity>> getEventStreaks(int? id);
}