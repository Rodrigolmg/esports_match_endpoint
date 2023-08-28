part of usecase;

class GetEventUseCase implements UseCase<EventEntity?, int?> {

  final EventRepository repository;

  const GetEventUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, EventEntity?>> call([int? eventId]) {
    return repository.getEvent(eventId);
  }


}