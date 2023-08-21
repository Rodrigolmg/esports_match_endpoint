part of repository_contract;

abstract class EventStreaksRepository{
  Future<Either<Failure, EventStreakEntity>> getEventStreaks(int? id);
}