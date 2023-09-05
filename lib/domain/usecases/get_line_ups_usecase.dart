part of usecase;

class GetLineUpsUseCase implements UseCase<Map<String, LineUpEntity>, int?> {

  final EventLineUpRepository repository;

  const GetLineUpsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Map<String, LineUpEntity>>> call([int? eventId]) {
    return repository.getLineUp(eventId);
  }


}