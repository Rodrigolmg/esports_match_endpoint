import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/error/failure.dart';
import 'package:esports_match_endpoint/core/usecases/usecase.dart';
import 'package:esports_match_endpoint/domain/entities/event_streak_entity.dart';
import 'package:esports_match_endpoint/domain/repositories/event_streaks_repository.dart';

class GetEventStreaks implements UseCase<EventStreakEntity, int?> {
  final EventStreaksRepository eventStreaksRepository;

  GetEventStreaks(this.eventStreaksRepository);

  @override
  Future<Either<Failure, EventStreakEntity>> call([int? id]) async {
    return await eventStreaksRepository.getEventStreaks(id);
  }
}
