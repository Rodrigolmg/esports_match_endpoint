import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';
import 'package:esports_match_endpoint/domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventLineUpRepository>()])
import 'get_event_line_ups_test.mocks.dart';

void main(){

  late GetLineUpsUseCase useCase;
  late MockEventLineUpRepository mockRepository;

  setUp((){
    mockRepository = MockEventLineUpRepository();
    useCase = GetLineUpsUseCase(repository: mockRepository);
  });

  const int tEventId = 1;

  LineUpEntity tLineUpAway = LineUpEntity(
    type: LineUpType.away
  );

  LineUpEntity tLineUpHome = LineUpEntity(
    type: LineUpType.home
  );

  Map<String, LineUpEntity> lineUps = {
    LineUpType.away.type: tLineUpAway,
    LineUpType.home.type: tLineUpHome
  };

  test('Should get Right value', () async {

    when(mockRepository.getLineUp(any))
        .thenAnswer((_) async => Right(lineUps));

    final result = await useCase(tEventId);

    expect(result, Right(lineUps));
    verify(mockRepository.getLineUp(tEventId));
    verifyNoMoreInteractions(mockRepository);
  });

}