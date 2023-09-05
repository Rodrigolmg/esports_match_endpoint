part of repository;

class EventLineUpRepositoryImpl implements EventLineUpRepository {

  final EventLineUpDataSource remoteDataSource;
  final EventLineUpLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const EventLineUpRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Map<String, LineUpEntity>>> getLineUp(int? eventId) async {

    if(await networkInfo.isConnected){
      try {
        Map<String, LineUpEntity> lineUps =
          await remoteDataSource.getLineUp(eventId);

        localDataSource.cacheLineUp(lineUps);

        return Right(lineUps);

      } on ServerException catch(sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        Map<String, LineUpEntity> lastLineUps =
        await localDataSource.getLastLineUp();
        return Right(lastLineUps);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}