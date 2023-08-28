part of usecase;

class GetEventStreaks implements UseCase<EventStreakEntity, int?> {
  final EventStreaksRepository eventStreaksRepository;

  GetEventStreaks(this.eventStreaksRepository);

  @override
  Future<Either<Failure, EventStreakEntity>> call([int? id]) async {
    return await eventStreaksRepository.getEventStreaks(id);
  }
}
