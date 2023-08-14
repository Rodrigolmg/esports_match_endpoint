
import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/error/exception.dart';
import 'package:esports_match_endpoint/core/error/failure.dart';
import 'package:esports_match_endpoint/core/platform/network_info.dart';
import 'package:esports_match_endpoint/data/datasources/event_streak_datasource.dart';
import 'package:esports_match_endpoint/data/datasources/local/event_streak_local_datasource.dart';
import 'package:esports_match_endpoint/data/model/event_streak_model.dart';
import 'package:esports_match_endpoint/domain/entities/event_streak_entity.dart';
import 'package:esports_match_endpoint/domain/repositories/event_streaks_repository.dart';

class EventStreaksRepositoryImpl implements EventStreaksRepository{

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
        final EventStreakModel eventStreak = await remoteDataSource.getEventStreaks(id);
        localDataSource.cacheEventStreak(eventStreak);

        return Right(eventStreak);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final EventStreakModel lastEventStreakLocal = await localDataSource.getLastEventStreak();
        return Right(lastEventStreakLocal);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }


}