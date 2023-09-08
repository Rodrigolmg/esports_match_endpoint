part of repository_contract;

abstract class EventLineUpRepository {
  Future<Either<Failure, Map<String,dynamic>>> getLineUp(int? eventId);
}