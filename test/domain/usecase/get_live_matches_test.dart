import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/domain/entities/event/event_entity.dart';
import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';
import 'package:esports_match_endpoint/domain/usecases/get_live_match_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<LiveMatchRepository>()])
import 'get_live_matches_test.mocks.dart';

void main(){

  late GetLiveMatchUseCase getLiveMatchUseCase;
  late MockLiveMatchRepository mockLiveMatchRepository;

  setUp(() {
    mockLiveMatchRepository = MockLiveMatchRepository();
    getLiveMatchUseCase = GetLiveMatchUseCase(mockLiveMatchRepository);
  });

  final List<EventEntity> tLiveMatches = [
    EventEntity(id: 1),
    EventEntity(id: 2)
  ];

  group('getLiveMatchesUsecase', () {

    test('Should get right value', () async {

      when(mockLiveMatchRepository.getLiveMatches())
          .thenAnswer((_) async => Right(tLiveMatches));

      final result = await getLiveMatchUseCase();

      expect(result, Right(tLiveMatches));
      verify(mockLiveMatchRepository.getLiveMatches());
      verifyNoMoreInteractions(mockLiveMatchRepository);

    });

  });

}