import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/datasources/datasource.dart';
import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/data/repositories/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventVoteDataSource>(),
  MockSpec<EventVoteLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
import 'event_vote_repository_impl_test.mocks.dart';

void main() {

  late EventVoteRepositoryImpl repositoryImpl;
  late MockEventVoteDataSource mockRemoteDataSource;
  late MockEventVoteLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp((){
    mockRemoteDataSource = MockEventVoteDataSource();
    mockLocalDataSource = MockEventVoteLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = EventVoteRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  EventVoteModel tEventVote = EventVoteModel(
    vote1: 1,
    vote2: 2
  );

  const int tEventId = 1;

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getEventVotes(tEventId);
    verify(mockNetworkInfo.isConnected);

  });

  group('Device is online', () {

    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockRemoteDataSource.getEventVote(any))
          .thenAnswer((_) async => tEventVote);

      final result = await repositoryImpl.getEventVotes(tEventId);

      verify(mockRemoteDataSource.getEventVote(tEventId));
      expect(result, equals(Right(tEventVote)));

    });

    test('Should cache data locally when the remote call is successfull', () async {

      when(mockRemoteDataSource.getEventVote(any))
          .thenAnswer((_) async => tEventVote);

      await repositoryImpl.getEventVotes(tEventId);

      verify(mockRemoteDataSource.getEventVote(tEventId));
      verify(mockLocalDataSource.cacheEventVote(tEventVote));

    });

    test('Should return server failure when remote call is unsuccessfull', () async {

      when(mockRemoteDataSource.getEventVote(any))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getEventVotes(tEventId);

      verify(mockRemoteDataSource.getEventVote(tEventId));
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
          when(mockLocalDataSource.getLastEventVote())
              .thenAnswer((_) async => tEventVote);

          final result = await repositoryImpl.getEventVotes(tEventId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastEventVote());
          expect(result, equals(Right(tEventVote)));
        });

    test('Should return CacheFailure when there is no cached data', () async {
      when(mockLocalDataSource.getLastEventVote())
          .thenThrow(CacheException());

      final result = await repositoryImpl.getEventVotes(tEventId);

      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getLastEventVote());
      expect(result, equals(Left(CacheFailure())));
    });
  });
}