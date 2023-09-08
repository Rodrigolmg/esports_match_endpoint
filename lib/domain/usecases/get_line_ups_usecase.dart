part of usecase;

class GetLineUpsUseCase implements UseCase<Map<String, dynamic>, int?> {

  final EventLineUpRepository repository;

  const GetLineUpsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Map<String, dynamic>>> call([int? eventId]) {
    return repository.getLineUp(eventId);
  }


}