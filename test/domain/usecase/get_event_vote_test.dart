import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';
import 'package:esports_match_endpoint/domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventVoteRepository>()])
import 'get_event_vote_test.mocks.dart';

void main(){

  late GetEventVote useCase;
  late MockEventVoteRepository mockEventVoteRepository;

  setUp(() {
    mockEventVoteRepository = MockEventVoteRepository();
    useCase = GetEventVote(mockEventVoteRepository);
  });

  EventVoteEntity tEventVote = EventVoteEntity(
    vote1: 1,
    vote2: 2
  );

  const int tEventId = 1;

  test('Should get right value', () async {

    when(mockEventVoteRepository.getEventVotes(any))
        .thenAnswer((_) async => Right(tEventVote));

    final result = await useCase(tEventId);

    expect(result, Right(tEventVote));
    verify(mockEventVoteRepository.getEventVotes(tEventId));
    verifyNoMoreInteractions(mockEventVoteRepository);

  });

}