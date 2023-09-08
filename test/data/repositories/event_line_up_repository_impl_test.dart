import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/datasources/datasource.dart';
import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/data/repositories/repository.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventLineUpDataSource>(),
  MockSpec<EventLineUpLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
import 'event_line_up_repository_impl_test.mocks.dart';

void main(){

  late EventLineUpRepositoryImpl repositoryImpl;
  late MockEventLineUpDataSource mockRemoteDataSource;
  late MockEventLineUpLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockEventLineUpDataSource();
    mockLocalDataSource = MockEventLineUpLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = EventLineUpRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  int? tEventId = 1;
  LineUpModel lineUpAway = LineUpModel(
    type: LineUpType.away
  );
  LineUpModel lineUpHome = LineUpModel(
    type: LineUpType.home
  );

  Map<String, dynamic> lineUps = {
    'away': lineUpAway,
    'home': lineUpHome,
    'confirmed': false
  };

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getLineUp(tEventId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getLineUp(any))
          .thenAnswer((_) async => lineUps);

      final result = await repositoryImpl.getLineUp(tEventId);

      verify(mockRemoteDataSource.getLineUp(tEventId));
      expect(result, equals(Right(lineUps)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockRemoteDataSource.getLineUp(any))
          .thenAnswer((_) async => lineUps);

      await repositoryImpl.getLineUp(tEventId);

      verify(mockRemoteDataSource.getLineUp(tEventId));
      verify(mockLocalDataSource.cacheLineUp(lineUps));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getLineUp(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getLineUp(tEventId);

      verify(mockRemoteDataSource.getLineUp(tEventId));
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
          when(mockLocalDataSource.getLastLineUp())
              .thenAnswer((_) async => lineUps);

          final result = await repositoryImpl.getLineUp(tEventId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastLineUp());
          expect(result, equals(Right(lineUps)));
        });

    test('Should return CacheFailure when there is no cached data',
            () async {
          when(mockLocalDataSource.getLastLineUp())
              .thenThrow(CacheException());

          final result = await repositoryImpl.getLineUp(tEventId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastLineUp());
          expect(result, equals(Left(CacheFailure())));
        });
  });

}