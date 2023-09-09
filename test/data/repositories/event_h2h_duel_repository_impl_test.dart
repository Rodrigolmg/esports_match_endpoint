import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/datasources/datasource.dart';
import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/data/repositories/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventH2hDuelDataSource>(),
  MockSpec<EventH2hDuelLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
import 'event_h2h_duel_repository_impl_test.mocks.dart';

void main(){

  late EventH2hDuelRepositoryImpl repositoryImpl;
  late MockEventH2hDuelDataSource mockRemoteDataSource;
  late MockEventH2hDuelLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDataSource = MockEventH2hDuelLocalDataSource();
    mockRemoteDataSource = MockEventH2hDuelDataSource();
    repositoryImpl = EventH2hDuelRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  const int tEventId = 1;

  H2hDuelModel tH2h = H2hDuelModel(
      managerDuel: null,
      teamDuel: TeamDuelModel(
          awayWins: 2,
          draws: 0,
          homeWins: 4
      )
  );

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getDuel(tEventId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getH2hDuel(any))
          .thenAnswer((_) async => tH2h);

      final result = await repositoryImpl.getDuel(tEventId);

      verify(mockRemoteDataSource.getH2hDuel(tEventId));
      expect(result, equals(Right(tH2h)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockRemoteDataSource.getH2hDuel(any))
          .thenAnswer((_) async => tH2h);

      await repositoryImpl.getDuel(tEventId);

      verify(mockRemoteDataSource.getH2hDuel(tEventId));
      verify(mockLocalDataSource.cacheH2hDuel(tH2h));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getH2hDuel(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getDuel(tEventId);

      verify(mockRemoteDataSource.getH2hDuel(tEventId));
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
          when(mockLocalDataSource.getLastH2hDuel())
              .thenAnswer((_) async => tH2h);

          final result = await repositoryImpl.getDuel(tEventId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastH2hDuel());
          expect(result, equals(Right(tH2h)));
        });

    test('Should return CacheFailure when there is no cached data',
            () async {
          when(mockLocalDataSource.getLastH2hDuel())
              .thenThrow(CacheException());

          final result = await repositoryImpl.getDuel(tEventId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastH2hDuel());
          expect(result, equals(Left(CacheFailure())));
        });
  });
}