part of repository_contract;

abstract class EventVoteRepository {
  Future<Either<Failure, EventVoteEntity?>> getEventVotes(int? eventId);
}