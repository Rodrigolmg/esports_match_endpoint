part of repository;

class EventStreaksRepositoryImpl implements EventStreaksRepository {

  final EventStreakDataSource remoteDataSource;
  final EventStreakLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const EventStreaksRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, EventStreakEntity>> getEventStreaks(int? id) async {
    if(await networkInfo.isConnected){
      try {
        final EventStreakModel? eventStreak = await remoteDataSource.getEventStreaks(id);
        localDataSource.cacheEventStreak(eventStreak!);

        return Right(eventStreak);
      } on ServerException catch(sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        final EventStreakModel? lastEventStreakLocal = await localDataSource.getLastEventStreak();
        return Right(lastEventStreakLocal!);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }


}