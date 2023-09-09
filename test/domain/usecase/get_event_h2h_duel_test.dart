import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/domain/entities/h2h_duel/h2h_duel_entity.dart';
import 'package:esports_match_endpoint/domain/entities/h2h_duel/team_duel_entity.dart';
import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';
import 'package:esports_match_endpoint/domain/usecases/get_event_h2h_duel_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventH2hDuelRepository>()])
import 'get_event_h2h_duel_test.mocks.dart';


void main(){

  late GetEventH2hDuelUseCase useCase;
  late MockEventH2hDuelRepository mockRepository;

  setUp(() {
    mockRepository = MockEventH2hDuelRepository();
    useCase = GetEventH2hDuelUseCase(repository: mockRepository);
  });

  const int tEventId = 1;

  H2hDuelEntity tH2h = H2hDuelEntity(
    managerDuel: null,
    teamDuel: TeamDuelEntity(
      awayWins: 2,
      draws: 0,
      homeWins: 4
    )
  );

  test('Should get Right value', () async {

    when(mockRepository.getDuel(tEventId))
        .thenAnswer((_) async => Right(tH2h));

    final result = await useCase(tEventId);

    expect(result, Right(tH2h));
    verify(mockRepository.getDuel(tEventId));
    verifyNoMoreInteractions(mockRepository);
  });

}