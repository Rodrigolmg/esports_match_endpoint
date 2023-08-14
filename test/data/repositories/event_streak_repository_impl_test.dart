import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/error/exception.dart';
import 'package:esports_match_endpoint/core/error/failure.dart';
import 'package:esports_match_endpoint/core/platform/network_info.dart';
import 'package:esports_match_endpoint/data/datasources/event_streak_datasource.dart';
import 'package:esports_match_endpoint/data/datasources/local/event_streak_local_datasource.dart';
import 'package:esports_match_endpoint/data/model/event_streak_model.dart';
import 'package:esports_match_endpoint/data/repositories/event_streaks_repository_impl.dart';
import 'package:esports_match_endpoint/domain/entities/enums/event_streak_type_enum.dart';
import 'package:esports_match_endpoint/domain/entities/event_streak_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventStreakDataSource>(), MockSpec<EventStreakLocalDataSource>(), MockSpec<NetworkInfo>()])
import 'event_streak_repository_impl_test.mocks.dart';

void main(){
  late EventStreaksRepositoryImpl repositoryImpl;
  late MockEventStreakDataSource mockEventStreakDataSource;
  late MockEventStreakLocalDataSource mockEventStreakLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockEventStreakDataSource = MockEventStreakDataSource();
    mockEventStreakLocalDataSource = MockEventStreakLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = EventStreaksRepositoryImpl(
      remoteDataSource: mockEventStreakDataSource,
      localDataSource: mockEventStreakLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  group('Get event streaks', () {
    const eventId = 1;
    const eventModel = EventStreakModel(
      type: EventStreakType.general,
      name: 'General',
      team: 'Team',
      continued: true,
      value: '3'
    );
    const EventStreakEntity eventEntity = eventModel;

    test('Should check if the device is online', () {

      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);

      repositoryImpl.getEventStreaks(eventId);
      verify(mockNetworkInfo.isConnected);
    });

    group('Device is online', () {
      setUp((){
        when(mockNetworkInfo.isConnected)
            .thenAnswer((_) async => true);
      });
      
      test('Should return remote data when the remote call is successfull', () async {

        when(mockEventStreakDataSource.getEventStreaks(any))
            .thenAnswer((_) async => eventModel);
        
        final result = await repositoryImpl.getEventStreaks(eventId);

        verify(mockEventStreakDataSource.getEventStreaks(eventId));
        expect(result, equals(const Right(eventModel)));


      });

      test('Should cache data locally when the remote call is successfull', () async {

        when(mockEventStreakDataSource.getEventStreaks(any))
            .thenAnswer((_) async => eventModel);

        await repositoryImpl.getEventStreaks(eventId);

        verify(mockEventStreakDataSource.getEventStreaks(eventId));
        verify(mockEventStreakLocalDataSource.cacheEventStreak(eventModel));

      });

      test('Should return server failure when remote call is unsuccessfull', () async {

        when(mockEventStreakDataSource.getEventStreaks(any))
            .thenThrow(ServerException());

        final result = await repositoryImpl.getEventStreaks(eventId);

        verify(mockEventStreakDataSource.getEventStreaks(eventId));
        verifyZeroInteractions(mockEventStreakLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
      
    });
    
    group('Device is offline', () {
      setUp((){
        when(mockNetworkInfo.isConnected)
            .thenAnswer((_) async => false);
      });

      test('Should return last locally cached data when the cached data is present',
      () async {
        when(mockEventStreakLocalDataSource.getLastEventStreak())
            .thenAnswer((_) async => eventModel);

        final result = await repositoryImpl.getEventStreaks(eventId);

        verifyZeroInteractions(mockEventStreakDataSource);
        verify(mockEventStreakLocalDataSource.getLastEventStreak());
        expect(result, equals(const Right(eventEntity)));
      });

      test('Should return CacheFailure when there is no cached data',
          () async {
        when(mockEventStreakLocalDataSource.getLastEventStreak())
            .thenThrow(CacheException());

        final result = await repositoryImpl.getEventStreaks(eventId);

        verifyZeroInteractions(mockEventStreakDataSource);
        verify(mockEventStreakLocalDataSource.getLastEventStreak());
        expect(result, equals(Left(CacheFailure())));
      });
    });

  });
}