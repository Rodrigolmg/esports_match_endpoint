part of repository_contract;

abstract class EventH2hDuelRepository {
  Future<Either<Failure, H2hDuelEntity>> getDuel(int? eventId);
}