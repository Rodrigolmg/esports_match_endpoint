part of repository;

class EventGameRepositoryImpl implements EventGameRepository {

  final EventGameDataSource remoteDataSource;
  final EventGameLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const EventGameRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<EventGameEntity>>> getEventGames(int? eventId)
    async {
      if(await networkInfo.isConnected){
        try {
          List<EventGameEntity> games =
          await remoteDataSource.getEventGames(eventId);
          localDataSource.cacheEventGames(games);

          return Right(games);

        } on ServerException catch(sE) {
          return Left(ServerFailure(statusCode: sE.statusCode));
        }
      } else {
        try {
          List<EventGameEntity> lastGames =
            await localDataSource.getLastEventGames();
          return Right(lastGames);
        } on CacheException {
          return Left(CacheFailure());
        }
      }
  }
}