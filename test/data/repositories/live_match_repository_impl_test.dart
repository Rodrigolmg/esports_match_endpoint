import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/datasources/datasource.dart';
import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/data/repositories/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<LiveMatchDataSource>(),
  MockSpec<LiveMatchLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
import 'live_match_repository_impl_test.mocks.dart';


void main(){

  late LiveMatchRepositoryImpl liveMatchRepositoryImpl;
  late MockLiveMatchDataSource mockLiveMatchDatasource;
  late MockLiveMatchLocalDataSource mockLiveMatchLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;


  setUp(() {
    mockLiveMatchDatasource = MockLiveMatchDataSource();
    mockLiveMatchLocalDataSource = MockLiveMatchLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    liveMatchRepositoryImpl = LiveMatchRepositoryImpl(
      remoteDatasource: mockLiveMatchDatasource,
      localDataSource: mockLiveMatchLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  List<EventModel>? tEvents = [
    EventModel(id: 1),
    EventModel(id: 2)
  ];

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    liveMatchRepositoryImpl.getLiveMatches();
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {

    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockLiveMatchDatasource.getLiveMatches())
          .thenAnswer((_) async => tEvents);

      final result = await liveMatchRepositoryImpl.getLiveMatches();

      verify(mockLiveMatchDatasource.getLiveMatches());
      expect(result, equals(Right(tEvents)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockLiveMatchDatasource.getLiveMatches())
          .thenAnswer((_) async => tEvents);

      await liveMatchRepositoryImpl.getLiveMatches();

      verify(mockLiveMatchDatasource.getLiveMatches());
      verify(mockLiveMatchLocalDataSource.cacheLiveMatches(tEvents));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockLiveMatchDatasource.getLiveMatches())
          .thenThrow(ServerException());

      final result = await liveMatchRepositoryImpl.getLiveMatches();

      verify(mockLiveMatchDatasource.getLiveMatches());
      verifyZeroInteractions(mockLiveMatchLocalDataSource);
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
      when(mockLiveMatchLocalDataSource.getLastLiveMatches())
          .thenAnswer((_) async => tEvents);

      final result = await liveMatchRepositoryImpl.getLiveMatches();

      verifyZeroInteractions(mockLiveMatchDatasource);
      verify(mockLiveMatchLocalDataSource.getLastLiveMatches());
      expect(result, equals(Right(tEvents)));
    });

    test('Should return CacheFailure when there is no cached data',
        () async {
      when(mockLiveMatchLocalDataSource.getLastLiveMatches())
          .thenThrow(CacheException());

      final result = await liveMatchRepositoryImpl.getLiveMatches();

      verifyZeroInteractions(mockLiveMatchDatasource);
      verify(mockLiveMatchLocalDataSource.getLastLiveMatches());
      expect(result, equals(Left(CacheFailure())));
    });
  });

}