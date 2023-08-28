part of repository;

class LiveMatchRepositoryImpl implements LiveMatchRepository {

  final LiveMatchDataSource remoteDatasource;
  final LiveMatchLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const LiveMatchRepositoryImpl({
    required this.remoteDatasource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<EventModel>?>> getLiveMatches() async {

    if(await networkInfo.isConnected){
      try {
        final List<EventModel>? events =
            await remoteDatasource.getLiveMatches();

        await localDataSource.cacheLiveMatches(events);

        return Right(events);

      } on ServerException catch(sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        final List<EventModel>? cachedEvents =
            await localDataSource.getLastLiveMatches();

        return Right(cachedEvents);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}