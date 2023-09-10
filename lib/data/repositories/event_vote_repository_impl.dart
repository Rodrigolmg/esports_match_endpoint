part of repository;

class EventVoteRepositoryImpl implements EventVoteRepository{

  final EventVoteDataSource remoteDataSource;
  final EventVoteLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const EventVoteRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, EventVoteEntity?>> getEventVotes(int? eventId) async {
    if(await networkInfo.isConnected){
      try {
        final EventVoteModel? eventVote = await remoteDataSource.getEventVote(eventId);
        localDataSource.cacheEventVote(eventVote);

        return Right(eventVote);
      } on ServerException catch(sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }
    } else {
      try {
        final EventVoteModel? eventVote = await localDataSource.getLastEventVote();
        return Right(eventVote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

}