part of usecase;

class GetLiveMatchUseCase implements UseCase<List<dynamic>?, dynamic> {

  final LiveMatchRepository repository;

  GetLiveMatchUseCase(this.repository);

  @override
  Future<Either<Failure, List<EventEntity>?>> call([params]) async {
    return await repository.getLiveMatches();
  }
}