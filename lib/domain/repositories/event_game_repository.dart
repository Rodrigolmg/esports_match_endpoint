part of repository_contract;

abstract class EventGameRepository {
  Future<Either<Failure, List<EventGameEntity>>> getEventGames(int? eventId);
}