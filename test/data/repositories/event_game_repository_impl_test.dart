import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/datasources/datasource.dart';
import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/data/repositories/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventGameDataSource>(),
  MockSpec<EventGameLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
import 'event_game_repository_impl_test.mocks.dart';

void main(){

  late EventGameRepositoryImpl repositoryImpl;
  late MockNetworkInfo mockNetworkInfo;
  late MockEventGameDataSource mockRemoteDataSource;
  late MockEventGameLocalDataSource mockLocalDataSource;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockEventGameDataSource();
    mockLocalDataSource = MockEventGameLocalDataSource();
    repositoryImpl = EventGameRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  const int tEventId = 1;

  List<EventGameModel> games = [
    EventGameModel(id: 1),
    EventGameModel(id: 2),
    EventGameModel(id: 3),
  ];

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getEventGames(tEventId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getEventGames(any))
          .thenAnswer((_) async => games);

      final result = await repositoryImpl.getEventGames(tEventId);

      verify(mockRemoteDataSource.getEventGames(tEventId));
      expect(result, equals(Right(games)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockRemoteDataSource.getEventGames(any))
          .thenAnswer((_) async => games);

      await repositoryImpl.getEventGames(tEventId);

      verify(mockRemoteDataSource.getEventGames(tEventId));
      verify(mockLocalDataSource.cacheEventGames(games));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getEventGames(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getEventGames(tEventId);

      verify(mockRemoteDataSource.getEventGames(tEventId));
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, equals(const Left(ServerFailure())));
    });
  });

  group('Device is offline', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => false);
    });

    test('Should return last locally cached data when the cached data is present',
            () async {
          when(mockLocalDataSource.getLastEventGames())
              .thenAnswer((_) async => games);

          final result = await repositoryImpl.getEventGames(tEventId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastEventGames());
          expect(result, equals(Right(games)));
        });

    test('Should return CacheFailure when there is no cached data',
            () async {
          when(mockLocalDataSource.getLastEventGames())
              .thenThrow(CacheException());

          final result = await repositoryImpl.getEventGames(tEventId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastEventGames());
          expect(result, equals(Left(CacheFailure())));
        });
  });
}