part of repository_contract;

abstract class EventRepository {
  Future<Either<Failure, EventEntity>> getEvent(int? eventId);
}