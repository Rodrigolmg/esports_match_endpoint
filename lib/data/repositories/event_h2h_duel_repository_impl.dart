part of repository;

class EventH2hDuelRepositoryImpl implements EventH2hDuelRepository {

  final EventH2hDuelDataSource remoteDataSource;
  final EventH2hDuelLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const EventH2hDuelRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, H2hDuelEntity>> getDuel(int? eventId) async {

    if(await networkInfo.isConnected){
      try {

        H2hDuelModel h2hDuel =
            await remoteDataSource.getH2hDuel(eventId);

        localDataSource.cacheH2hDuel(h2hDuel);

        return Right(h2hDuel);

      } on ServerException catch (sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {

        H2hDuelModel lastH2hDuel =
          await localDataSource.getLastH2hDuel();

        return Right(lastH2hDuel);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}