part of usecase;

class GetLineUpsUseCase implements UseCase<LineUpEntity, int?> {

  final EventLineUpRepository repository;

  const GetLineUpsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, LineUpEntity>> call([int? eventId]) {
    // TODO: implement call
    throw UnimplementedError();
  }


}