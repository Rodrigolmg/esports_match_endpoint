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
  Future<Either<Failure, Map<String, dynamic>>> getLineUp(int? eventId) async {

    if(await networkInfo.isConnected){
      try {
        Map<String, dynamic> lineUps =
          await remoteDataSource.getLineUp(eventId);

        localDataSource.cacheLineUp(lineUps);

        return Right(lineUps);

      } on ServerException catch(sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        Map<String, dynamic> lastLineUps =
        await localDataSource.getLastLineUp();
        return Right(lastLineUps);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}