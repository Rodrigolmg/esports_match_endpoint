import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';
import 'package:esports_match_endpoint/domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventGameRepository>()])
import 'get_event_game_test.mocks.dart';

void main(){

  late GetEventGameUseCase useCase;
  late MockEventGameRepository mockRepository;

  setUp(() {
    mockRepository = MockEventGameRepository();
    useCase = GetEventGameUseCase(repository: mockRepository);
  });

  const int tEventId = 1;

  List<EventGameEntity> games = [
    EventGameEntity(id: 1),
    EventGameEntity(id: 2),
    EventGameEntity(id: 3),
  ];

  test('Should get Right value', () async {

    when(mockRepository.getEventGames(any))
        .thenAnswer((_) async => Right(games));

    final result = await useCase(tEventId);

    expect(result, Right(games));
    verify(mockRepository.getEventGames(tEventId));
    verifyNoMoreInteractions(mockRepository);
  });

}