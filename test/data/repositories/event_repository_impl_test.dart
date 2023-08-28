import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/datasources/datasource.dart';
import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/data/repositories/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventDataSource>(),
  MockSpec<EventLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
import 'event_repository_impl_test.mocks.dart';

void main() {
  late EventRepositoryImpl repositoryImpl;
  late MockEventDataSource mockRemoteDataSource;
  late MockEventLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockEventDataSource();
    mockLocalDataSource = MockEventLocalDataSource();
    repositoryImpl = EventRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  EventModel? tEvent = EventModel(id: 3);
  const int? tEventId = 3;

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getEvent(3);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getEvent(any))
          .thenAnswer((_) async => tEvent);

      final result = await repositoryImpl.getEvent(tEventId);

      verify(mockRemoteDataSource.getEvent(tEventId));
      expect(result, equals(Right(tEvent)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockRemoteDataSource.getEvent(any))
          .thenAnswer((_) async => tEvent);

      await repositoryImpl.getEvent(tEventId);

      verify(mockRemoteDataSource.getEvent(tEventId));
      verify(mockLocalDataSource.cacheEvent(tEvent));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getEvent(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getEvent(tEventId);

      verify(mockRemoteDataSource.getEvent(tEventId));
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
      when(mockLocalDataSource.getLastEvent())
          .thenAnswer((_) async => tEvent);

        final result = await repositoryImpl.getEvent(tEventId);

        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastEvent());
        expect(result, equals(Right(tEvent)));
    });

    test('Should return CacheFailure when there is no cached data',
            () async {
      when(mockLocalDataSource.getLastEvent())
          .thenThrow(CacheException());

      final result = await repositoryImpl.getEvent(tEventId);

      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getLastEvent());
      expect(result, equals(Left(CacheFailure())));
    });
  });
}