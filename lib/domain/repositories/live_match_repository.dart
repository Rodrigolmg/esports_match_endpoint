part of repository_contract;

abstract class LiveMatchRepository {
  Future<Either<Failure, List<EventEntity>>> getLiveMatches();
}