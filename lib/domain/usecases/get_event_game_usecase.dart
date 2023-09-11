part of usecase;

class GetEventGameUseCase implements UseCase<List<EventGameEntity>?, int?> {

  final EventGameRepository repository;

  const GetEventGameUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<EventGameEntity>?>> call([int? eventId]) {
    return repository.getEventGames(eventId);
  }
}