part of repository;

class EventRepositoryImpl implements EventRepository {

  final EventDataSource remoteDataSource;
  final EventLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const EventRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, EventEntity?>> getEvent(int? eventId) async {
    if(await networkInfo.isConnected){
      try {

        EventModel? event = await remoteDataSource.getEvent(eventId);
        localDataSource.cacheEvent(event);

        return Right(event);

      } on ServerException catch (sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        EventModel? lastEventCached = await localDataSource.getLastEvent();
        return Right(lastEventCached);
      } on CacheException {
        return Left(CacheFailure());
      }

    }
  }




}