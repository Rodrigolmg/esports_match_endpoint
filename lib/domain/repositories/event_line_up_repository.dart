part of repository_contract;

abstract class EventLineUpRepository {
  Future<Either<Failure, Map<String,LineUpEntity>>> getLineUp(int? eventId);
}