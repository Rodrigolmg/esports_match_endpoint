part of usecase;

class GetEventVote implements UseCase<EventVoteEntity?, int?> {

  final EventVoteRepository repository;

  const GetEventVote(
    this.repository,
  );

  @override
  Future<Either<Failure, EventVoteEntity?>> call([int? eventId]) {
    return repository.getEventVotes(eventId);
  }
}